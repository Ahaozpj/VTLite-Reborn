.class public final Lorg/vtlite/reborn/id64/CP537NativeTeardown;
.super Ljava/lang/Object;


# direct methods
.method public static clear(Landroid/view/View;)Z
    .registers 7

    const/4 v0, 0x1

    if-eqz p0, :cond_5b

    :try_start_3
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eqz v1, :cond_5a

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_5a

    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v1

    const v2, 0x7f0a0353

    if-ne v1, v2, :cond_5b

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v2, v1, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_5b

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v2

    const v3, 0x7f0a0561

    if-ne v2, v3, :cond_5b

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    :goto_31
    if-ltz v2, :cond_47

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v4, v3, Lorg/vtlite/reborn/id64/CP528ListScreen;

    if-eqz v4, :cond_44

    check-cast v3, Lorg/vtlite/reborn/id64/CP528ListScreen;

    invoke-static {v3}, Lorg/vtlite/reborn/id64/CP536ListMount;->unmount(Lorg/vtlite/reborn/id64/CP528ListScreen;)Z

    move-result v4

    if-nez v4, :cond_44

    const/4 v0, 0x0

    :cond_44
    add-int/lit8 v2, v2, -0x1

    goto :goto_31

    :cond_47
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_4c
    if-ge v3, v2, :cond_5b

    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v5, v4, Lorg/vtlite/reborn/id64/CP528ListScreen;

    if-nez v5, :cond_5a

    add-int/lit8 v3, v3, 0x1

    goto :goto_4c
    :try_end_59
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_59} :catch_59
    .catch Ljava/lang/LinkageError; {:try_start_3 .. :try_end_59} :catch_59

    :catch_59
    move-exception v1

    :cond_5a
    const/4 v0, 0x0

    :cond_5b
    return v0
.end method
