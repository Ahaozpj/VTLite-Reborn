.class final Lorg/vtlite/reborn/id64/CP536ListMount;
.super Ljava/lang/Object;


# direct methods
.method private static cp556LegacyBridge(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/CP555PageHandoff;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP528ListScreen;
    .registers 6

    invoke-static/range {p0 .. p5}, Lorg/vtlite/reborn/id64/CP536ListMount;->cp556Mount(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/CP555PageHandoff;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP528ListScreen;

    move-result-object p0

    return-object p0
.end method

.method static cp556Mount(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/CP555PageHandoff;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP528ListScreen;
    .registers 11

    invoke-static {}, Lorg/vtlite/reborn/id64/CP536ListMount;->requireMain()V

    const/4 v0, 0x0

    if-eqz p2, :cond_93

    if-eqz p3, :cond_93

    if-eqz p4, :cond_93

    if-eqz p5, :cond_93

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0a0561

    if-ne v1, v2, :cond_93

    invoke-virtual {p3}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0a0353

    if-ne v1, v2, :cond_93

    invoke-virtual {p4}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0a0af6

    if-ne v1, v2, :cond_93

    invoke-virtual {p3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v1, p2, :cond_93

    invoke-virtual {p4}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v1, p2, :cond_93

    invoke-virtual {p2}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_93

    invoke-virtual {p3}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_93

    invoke-virtual {p4}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-eqz v1, :cond_93

    const/4 v2, 0x0

    :goto_46
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v2, v1, :cond_57

    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v1, v1, Lorg/vtlite/reborn/id64/CP528ListScreen;

    if-nez v1, :cond_93

    add-int/lit8 v2, v2, 0x1

    goto :goto_46

    :cond_57
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p5}, Lorg/vtlite/reborn/id64/CP528ListScreen;->create(Landroid/content/Context;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP528ListScreen;

    move-result-object v1

    if-eqz v1, :cond_93

    if-eqz p0, :cond_6c

    if-eqz p1, :cond_6f

    invoke-virtual {v1, p0, p1}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Bind(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/CP555PageHandoff;)Z

    move-result v2

    if-eqz v2, :cond_6f

    goto :goto_73

    :cond_6c
    if-nez p1, :cond_6f

    goto :goto_73

    :cond_6f
    invoke-static {v1}, Lorg/vtlite/reborn/id64/CP536ListMount;->unmount(Lorg/vtlite/reborn/id64/CP528ListScreen;)Z

    return-object v0

    :goto_73
    :try_start_73
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-ne v3, p2, :cond_87

    invoke-virtual {v1}, Landroid/view/View;->bringToFront()V
    :try_end_85
    .catch Ljava/lang/RuntimeException; {:try_start_73 .. :try_end_85} :catch_86
    .catch Ljava/lang/LinkageError; {:try_start_73 .. :try_end_85} :catch_86

    return-object v1

    :catch_86
    move-exception v3

    :cond_87
    invoke-static {v1}, Lorg/vtlite/reborn/id64/CP536ListMount;->unmount(Lorg/vtlite/reborn/id64/CP528ListScreen;)Z

    move-result v2

    if-nez v2, :cond_93

    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3}, Ljava/lang/IllegalStateException;-><init>()V

    throw v3

    :cond_93
    return-object v0
.end method

.method static mount(Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP528ListScreen;
    .registers 6

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-static/range {v0 .. v5}, Lorg/vtlite/reborn/id64/CP536ListMount;->cp556LegacyBridge(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/CP555PageHandoff;Landroid/widget/FrameLayout;Landroid/view/View;Landroid/view/View;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP528ListScreen;

    move-result-object v0

    return-object v0
.end method

.method private static requireMain()V
    .registers 2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_d

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_d

    return-void

    :cond_d
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0
.end method

.method static unmount(Lorg/vtlite/reborn/id64/CP528ListScreen;)Z
    .registers 4

    invoke-static {}, Lorg/vtlite/reborn/id64/CP536ListMount;->requireMain()V

    const/4 v0, 0x1

    if-eqz p0, :cond_26

    :try_start_6
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->close()Z

    move-result v0
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_a} :catch_b
    .catch Ljava/lang/LinkageError; {:try_start_6 .. :try_end_a} :catch_b

    goto :goto_d

    :catch_b
    move-exception v1

    const/4 v0, 0x0

    :goto_d
    :try_start_d
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_26

    instance-of v2, v1, Landroid/view/ViewGroup;

    if-eqz v2, :cond_22

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_26

    :cond_22
    const/4 v0, 0x0
    :try_end_23
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_23} :catch_24
    .catch Ljava/lang/LinkageError; {:try_start_d .. :try_end_23} :catch_24

    goto :goto_26

    :catch_24
    move-exception v1

    const/4 v0, 0x0

    :cond_26
    :goto_26
    return v0
.end method
