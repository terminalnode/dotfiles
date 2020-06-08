/* See LICENSE file for copyright and license details. */
/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";

/*
 * Nord color definitions
 * Probably not gonna use all of them, but they're
 * good to have on hand for testing and such.
 */
static const char polar1[]          = "#2e3440";
static const char polar2[]          = "#3b4252";
static const char polar3[]          = "#434c5e";
static const char polar4[]          = "#3c566a";
static const char snow1[]           = "#d8dee9";
static const char snow2[]           = "#e5e9f0";
static const char snow3[]           = "#eceff4";
static const char frost1[]          = "#8fbcbb";
static const char frost2[]          = "#88c0d0";
static const char frost3[]          = "#81a1c1";
static const char frost4[]          = "#5e81ac";
static const char red[]             = "#bf616a";
static const char orange[]          = "#d08770";
static const char yellow[]          = "#ebcb8b";
static const char green[]           = "#a3be8c";
static const char magenta[]         = "#b48ead";
static const char *colors[][3]      = {
  /*               fg       bg        border   */
  [SchemeNorm] = { snow1,   polar1,   polar2 },
  [SchemeSel]  = { snow3,   polar4,   frost4 },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
  /* xprop(1):
   *	WM_CLASS(STRING) = instance, class
   *	WM_NAME(STRING) = title
   */
  /* class            instance    title       tags mask     isfloating    isterminal  noswallow   monitor */
  { "Gimp",           NULL,       NULL,       0,            1,            0,          0,          -1 },
  { "Firefox",        NULL,       NULL,       1 << 8,       0,            0,          0,          -1 },
  { "st",             NULL,       NULL,       0,            0,            1,          1,          -1 },
  { "Android Studio", NULL,       NULL,       0,            0,            0,          1,          -1 },
  { "Intellij IDEA",  NULL,       NULL,       0,            0,            0,          1,          -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
  /* symbol       arrange function */
  { "[tiling]",   tile },    /* first entry is default */
  { "[floating]", NULL },    /* no layout function means floating behavior */
  { "[monocle]",  monocle }, /* show only one window */
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
  { MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
  { MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
  { MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
  { MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", polar1, "-nf", snow1, "-sb", frost4, "-sf", snow3, NULL };
static const char *termcmd[]  = { "st", NULL };

static Key keys[] = {
  /* Basic navigation */
  /* See TAGKEYS definition above */
  TAGKEYS(XK_1, 0)
  TAGKEYS(XK_2, 1)
  TAGKEYS(XK_3, 2)
  TAGKEYS(XK_4, 3)
  TAGKEYS(XK_5, 4)
  TAGKEYS(XK_6, 5)
  TAGKEYS(XK_7, 6)
  TAGKEYS(XK_8, 7)
  TAGKEYS(XK_9, 8)

  /* Important options */
  /* modifier                     key         function        argument */
  { MODKEY,                       XK_space,   spawn,          {.v = dmenucmd } },
  { MODKEY,                       XK_Return,  spawn,          {.v = termcmd } },
  { MODKEY|ShiftMask,             XK_Return,  zoom,           {0} },
  { MODKEY,                       XK_Tab,     view,           {0} },
  { MODKEY|ShiftMask,             XK_q,       quit,           {0} },
  { MODKEY,                       XK_p,       setlayout,      {0} },
  { MODKEY|ShiftMask,             XK_p,       togglefloating, {0} },
  /* Change which item in the stack to focus */
  { MODKEY,                       XK_j,       focusstack,     {.i = +1 } },
  { MODKEY,                       XK_k,       focusstack,     {.i = -1 } },
  /* Change monitor focus */
  { MODKEY,                       XK_comma,   focusmon,       {.i = -1 } },
  { MODKEY,                       XK_period,  focusmon,       {.i = +1 } },
  /* Move focused window to other monitor */
  { MODKEY|ShiftMask,             XK_comma,   tagmon,         {.i = -1 } },
  { MODKEY|ShiftMask,             XK_period,  tagmon,         {.i = +1 } },
  /* Promote and depromote windows to master */
  { MODKEY,                       XK_i,       incnmaster,     {.i = +1 } },
  { MODKEY,                       XK_d,       incnmaster,     {.i = -1 } },

  /* Unsorted options stuff */
  { MODKEY,                       XK_b,       togglebar,      {0} },
  { MODKEY,                       XK_h,       setmfact,       {.f = -0.05} },
  { MODKEY,                       XK_l,       setmfact,       {.f = +0.05} },
  { MODKEY|ShiftMask,             XK_c,       killclient,     {0} },
  { MODKEY,                       XK_t,       setlayout,      {.v = &layouts[0]} },
  { MODKEY,                       XK_f,       setlayout,      {.v = &layouts[1]} },
  { MODKEY,                       XK_m,       setlayout,      {.v = &layouts[2]} },
  { MODKEY,                       XK_0,       view,           {.ui = ~0 } },
  { MODKEY|ShiftMask,             XK_0,       tag,            {.ui = ~0 } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
  /* click                event mask      button          function        argument */
  { ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
  { ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
  { ClkWinTitle,          0,              Button2,        zoom,           {0} },
  { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
  { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
  { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
  { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
  { ClkTagBar,            0,              Button1,        view,           {0} },
  { ClkTagBar,            0,              Button3,        toggleview,     {0} },
  { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
  { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

