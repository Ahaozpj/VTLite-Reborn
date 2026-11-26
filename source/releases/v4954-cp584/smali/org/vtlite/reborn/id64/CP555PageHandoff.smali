.class public final Lorg/vtlite/reborn/id64/CP555PageHandoff;
.super Ljava/lang/Object;


# instance fields
.field private final origin:Lorg/vtlite/reborn/id64/CP518ImOrigin;

.field private final page:Lorg/vtlite/reborn/id64/DialogPageModel$Page;

.field private final stamp:Ljava/lang/Object;

.field private final ticket:Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;


# direct methods
.method private constructor <init>(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/CP555PageHandoff;->ticket:Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/CP555PageHandoff;->origin:Lorg/vtlite/reborn/id64/CP518ImOrigin;

    iput-object p3, p0, Lorg/vtlite/reborn/id64/CP555PageHandoff;->stamp:Ljava/lang/Object;

    iput-object p4, p0, Lorg/vtlite/reborn/id64/CP555PageHandoff;->page:Lorg/vtlite/reborn/id64/DialogPageModel$Page;

    return-void
.end method

.method private static admitted(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;)Z
    .registers 5

    if-eqz p0, :cond_17

    if-eqz p2, :cond_17

    if-eqz p3, :cond_17

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Current(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p2, p1, p3}, Lorg/vtlite/reborn/id64/CP518ImOrigin;->cp553MatchesTransportOwner(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Current(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z

    move-result v0

    return v0

    :cond_17
    const/4 v0, 0x0

    return v0
.end method

.method public static cp569Mount(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;)Z
    .registers 11

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_51

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_51

    if-eqz p0, :cond_51

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Take()Lorg/vtlite/reborn/id64/CP555PageHandoff;

    move-result-object v0

    if-eqz v0, :cond_51

    invoke-virtual {v0, p0}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->valid(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)Z

    move-result v1

    if-eqz v1, :cond_51

    iget-object v1, v0, Lorg/vtlite/reborn/id64/CP555PageHandoff;->page:Lorg/vtlite/reborn/id64/DialogPageModel$Page;

    move-object v2, p0

    move-object v3, v0

    move-object v4, p1

    move-object v5, p2

    move-object p1, v0

    move-object v0, v2

    move-object v2, v4

    move-object v4, p3

    move-object v5, v1

    move-object v1, v3

    move-object v3, p2

    invoke-static/range {v0 .. v5}, Lorg/vtlite/reborn/id64/CP536ListMount;->cp556Mount(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/CP555PageHandoff;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP528ListScreen;

    move-result-object v2

    move-object v0, p1

    if-eqz v2, :cond_51

    :try_start_2e
    invoke-virtual {v2}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Valid()Z

    move-result v1

    if-eqz v1, :cond_45

    invoke-virtual {v0, p0}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->valid(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)Z

    move-result v1

    if-eqz v1, :cond_45

    if-eqz p4, :cond_42

    invoke-virtual {v2, p4}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp569HideRetry(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_45
    :try_end_42
    .catch Ljava/lang/RuntimeException; {:try_start_2e .. :try_end_42} :catch_44
    .catch Ljava/lang/LinkageError; {:try_start_2e .. :try_end_42} :catch_44

    :cond_42
    const/4 v0, 0x1

    return v0

    :catch_44
    move-exception v3

    :cond_45
    invoke-static {v2}, Lorg/vtlite/reborn/id64/CP536ListMount;->unmount(Lorg/vtlite/reborn/id64/CP528ListScreen;)Z

    move-result v1

    if-nez v1, :cond_51

    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    :cond_51
    const/4 v0, 0x0

    return v0
.end method

.method static create(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;Ljava/lang/String;)Lorg/vtlite/reborn/id64/CP555PageHandoff;
    .registers 8

    :try_start_0
    invoke-static {p0, p1, p2, p3}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->admitted(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-static {p4}, Lorg/vtlite/reborn/id64/DialogPageModel;->capture(Ljava/lang/String;)Lorg/vtlite/reborn/id64/DialogPageModel$Page;

    move-result-object v1

    if-eqz v1, :cond_2b

    invoke-virtual {v1}, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->cp504NeedsLegacyIdProtection()Z

    move-result v0

    if-eqz v0, :cond_2b

    invoke-static {v1}, Lorg/vtlite/reborn/id64/CP522DialogIndex;->fromPage(Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP522DialogIndex;

    move-result-object v2

    if-eqz v2, :cond_2b

    invoke-virtual {v2}, Lorg/vtlite/reborn/id64/CP522DialogIndex;->size()I

    move-result v0

    if-lez v0, :cond_2b

    invoke-static {p0, p1, p2, p3}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->admitted(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2b

    new-instance v0, Lorg/vtlite/reborn/id64/CP555PageHandoff;

    invoke-direct {v0, p1, p2, p3, v1}, Lorg/vtlite/reborn/id64/CP555PageHandoff;-><init>(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)V
    :try_end_29
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_29} :catch_2a
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_29} :catch_2a

    return-object v0

    :catch_2a
    move-exception v0

    :cond_2b
    const/4 v0, 0x0

    return-object v0
.end method

.method public static mount(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;)Z
    .registers 5

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, p3, v0}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->cp569Mount(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method valid(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)Z
    .registers 5

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP555PageHandoff;->ticket:Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP555PageHandoff;->origin:Lorg/vtlite/reborn/id64/CP518ImOrigin;

    iget-object v2, p0, Lorg/vtlite/reborn/id64/CP555PageHandoff;->stamp:Ljava/lang/Object;

    invoke-static {p1, v0, v1, v2}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->admitted(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
