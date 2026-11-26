.class final Lorg/vtlite/reborn/id64/CP528ListScreen;
.super Landroid/widget/ListView;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Ljava/lang/Runnable;


# instance fields
.field private cleanupFailed:Z

.field private closing:Z

.field private cp556Guarded:Z

.field private cp556Handoff:Lorg/vtlite/reborn/id64/CP555PageHandoff;

.field private cp556Token:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

.field private cp569Retry:Landroid/view/View;

.field private cp583LastTick:J

.field private ownedAdapter:Lorg/vtlite/reborn/id64/CP525ListAdapter;

.field private selectedRow:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

.field private selectedView:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/content/Context;Lorg/vtlite/reborn/id64/CP525ListAdapter;)V
    .registers 4

    invoke-direct {p0, p1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    sget v0, Lcom/vk/im/ui/c;->im_new_theme:I

    invoke-static {p1, v0}, Lcom/vk/core/util/ContextExtKt;->g(Landroid/content/Context;I)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/widget/ListView;->setDivider(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0, v0}, Landroid/widget/ListView;->setDividerHeight(I)V

    :cond_12
    iput-object p2, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->ownedAdapter:Lorg/vtlite/reborn/id64/CP525ListAdapter;

    invoke-virtual {p0, p2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {p0, p0}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method private active()Lorg/vtlite/reborn/id64/CP525ListAdapter;
    .registers 3

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Valid()Z

    move-result v0

    if-eqz v0, :cond_1d

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->ownedAdapter:Lorg/vtlite/reborn/id64/CP525ListAdapter;

    if-eqz v0, :cond_1d

    invoke-virtual {p0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v1

    if-ne v0, v1, :cond_1d

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result v1

    if-eqz v1, :cond_1d

    return-object v0

    :cond_1d
    const/4 v0, 0x0

    return-object v0
.end method

.method private clearSelection()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->selectedRow:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->selectedView:Landroid/view/View;

    return-void
.end method

.method private cp583RefreshVisibleDates()V
    .registers 12

    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp583LastTick:J

    sub-long v2, v0, v2

    const-wide/32 v4, 0xea60

    cmp-long v2, v2, v4

    if-ltz v2, :cond_43

    invoke-direct {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->active()Lorg/vtlite/reborn/id64/CP525ListAdapter;

    move-result-object v2

    if-eqz v2, :cond_43

    iput-wide v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp583LastTick:J

    invoke-virtual {p0}, Landroid/widget/AdapterView;->getFirstVisiblePosition()I

    move-result v3

    if-ltz v3, :cond_43

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    const/4 v5, 0x0

    :goto_22
    if-ge v5, v4, :cond_43

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Valid()Z

    move-result v6

    if-eqz v6, :cond_43

    invoke-virtual {p0, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    instance-of v7, v6, Lorg/vtlite/reborn/id64/CP525RowView;

    if-eqz v7, :cond_3f

    add-int v7, v3, v5

    invoke-virtual {v2, v6, v7}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->resolve(Landroid/view/View;I)Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    move-result-object v7

    if-eqz v7, :cond_3f

    check-cast v6, Lorg/vtlite/reborn/id64/CP525RowView;

    invoke-virtual {v6, v7}, Lorg/vtlite/reborn/id64/CP525RowView;->cp583RefreshDate(Lorg/vtlite/reborn/id64/DialogPageModel$Row;)V

    :cond_3f
    add-int/lit8 v5, v5, 0x1

    goto :goto_22
    :try_end_42
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_42} :catch_42
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_42} :catch_42

    :catch_42
    move-exception v0

    :cond_43
    return-void
.end method

.method static create(Landroid/content/Context;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP528ListScreen;
    .registers 4

    invoke-static {}, Lorg/vtlite/reborn/id64/CP528ListScreen;->requireMain()V

    if-eqz p0, :cond_16

    invoke-static {p1}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->fromPage(Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP525ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_16

    :try_start_b
    new-instance v1, Lorg/vtlite/reborn/id64/CP528ListScreen;

    invoke-direct {v1, p0, v0}, Lorg/vtlite/reborn/id64/CP528ListScreen;-><init>(Landroid/content/Context;Lorg/vtlite/reborn/id64/CP525ListAdapter;)V
    :try_end_10
    .catchall {:try_start_b .. :try_end_10} :catchall_11

    return-object v1

    :catchall_11
    move-exception v1

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->close()V

    throw v1

    :cond_16
    const/4 v0, 0x0

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

    const-string v1, "List screen requires main looper"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method close()Z
    .registers 4

    invoke-static {}, Lorg/vtlite/reborn/id64/CP528ListScreen;->requireMain()V

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp569Retry:Landroid/view/View;

    if-eqz v0, :cond_d

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp569Retry:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_d
    invoke-direct {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->clearSelection()V

    invoke-virtual {p0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Token:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    iput-object v1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Handoff:Lorg/vtlite/reborn/id64/CP555PageHandoff;

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->closing:Z

    if-eqz v1, :cond_1e

    const/4 v0, 0x0

    return v0

    :cond_1e
    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->ownedAdapter:Lorg/vtlite/reborn/id64/CP525ListAdapter;

    if-eqz v0, :cond_4b

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->ownedAdapter:Lorg/vtlite/reborn/id64/CP525ListAdapter;

    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->closing:Z

    :try_start_28
    const/16 v1, 0x8

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V
    :try_end_2d
    .catch Ljava/lang/RuntimeException; {:try_start_28 .. :try_end_2d} :catch_2e
    .catch Ljava/lang/LinkageError; {:try_start_28 .. :try_end_2d} :catch_2e

    goto :goto_31

    :catch_2e
    move-exception v1

    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cleanupFailed:Z

    :goto_31
    :try_start_31
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/AdapterView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    :try_end_35
    .catch Ljava/lang/RuntimeException; {:try_start_31 .. :try_end_35} :catch_36
    .catch Ljava/lang/LinkageError; {:try_start_31 .. :try_end_35} :catch_36

    goto :goto_39

    :catch_36
    move-exception v1

    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cleanupFailed:Z

    :goto_39
    :try_start_39
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V
    :try_end_3d
    .catch Ljava/lang/RuntimeException; {:try_start_39 .. :try_end_3d} :catch_3e
    .catch Ljava/lang/LinkageError; {:try_start_39 .. :try_end_3d} :catch_3e

    goto :goto_41

    :catch_3e
    move-exception v1

    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cleanupFailed:Z

    :goto_41
    :try_start_41
    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->close()V
    :try_end_44
    .catch Ljava/lang/RuntimeException; {:try_start_41 .. :try_end_44} :catch_45
    .catch Ljava/lang/LinkageError; {:try_start_41 .. :try_end_44} :catch_45

    goto :goto_48

    :catch_45
    move-exception v1

    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cleanupFailed:Z

    :goto_48
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->closing:Z

    :cond_4b
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cleanupFailed:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method cp556Bind(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/CP555PageHandoff;)Z
    .registers 4

    invoke-static {}, Lorg/vtlite/reborn/id64/CP528ListScreen;->requireMain()V

    const/4 v0, 0x0

    if-eqz p1, :cond_25

    if-eqz p2, :cond_25

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Guarded:Z

    if-nez v0, :cond_24

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Guarded:Z

    iput-object p1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Token:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Handoff:Lorg/vtlite/reborn/id64/CP555PageHandoff;

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Valid()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-virtual {p1, p0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp560Register(Lorg/vtlite/reborn/id64/CP528ListScreen;)Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Valid()Z

    move-result v0

    return v0

    :cond_24
    const/4 v0, 0x0

    :cond_25
    return v0
.end method

.method cp556Valid()Z
    .registers 3

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Guarded:Z

    if-nez v0, :cond_6

    const/4 v0, 0x1

    return v0

    :cond_6
    :try_start_6
    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Handoff:Lorg/vtlite/reborn/id64/CP555PageHandoff;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Token:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    if-eqz v0, :cond_14

    if-eqz v1, :cond_14

    invoke-virtual {v0, v1}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->valid(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)Z

    move-result v0
    :try_end_12
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_12} :catch_13
    .catch Ljava/lang/LinkageError; {:try_start_6 .. :try_end_12} :catch_13

    return v0

    :catch_13
    move-exception v0

    :cond_14
    const/4 v0, 0x0

    return v0
.end method

.method cp569HideRetry(Landroid/view/View;)Z
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_15

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne v0, v1, :cond_15

    iput-object p1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp569Retry:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    const/4 v0, 0x1

    return v0

    :cond_15
    const/4 v0, 0x0

    return v0
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 3

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Valid()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-super {p0, p1}, Landroid/widget/ListView;->dispatchDraw(Landroid/graphics/Canvas;)V

    :cond_9
    return-void
.end method

.method protected onAttachedToWindow()V
    .registers 2

    invoke-super {p0}, Landroid/widget/ListView;->onAttachedToWindow()V

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Guarded:Z

    if-eqz v0, :cond_12

    invoke-virtual {p0, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    move-result v0

    if-nez v0, :cond_12

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Token:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Handoff:Lorg/vtlite/reborn/id64/CP555PageHandoff;

    :cond_12
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 2

    :try_start_0
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->close()Z
    :try_end_3
    .catchall {:try_start_0 .. :try_end_3} :catchall_7

    invoke-super {p0}, Landroid/widget/ListView;->onDetachedFromWindow()V

    return-void

    :catchall_7
    move-exception v0

    invoke-super {p0}, Landroid/widget/ListView;->onDetachedFromWindow()V

    throw v0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 9

    invoke-static {}, Lorg/vtlite/reborn/id64/CP528ListScreen;->requireMain()V

    invoke-direct {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->clearSelection()V

    if-ne p1, p0, :cond_31

    invoke-direct {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->active()Lorg/vtlite/reborn/id64/CP525ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_31

    if-eqz p2, :cond_31

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-ne v2, p0, :cond_31

    invoke-virtual {v0, p2, p3}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->resolve(Landroid/view/View;I)Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    move-result-object v1

    if-eqz v1, :cond_31

    iget-object v2, v1, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    if-eqz v2, :cond_31

    iput-object v1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->selectedRow:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->selectedView:Landroid/view/View;

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Guarded:Z

    if-eqz v0, :cond_31

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->takeSelection()Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v0

    if-eqz v0, :cond_31

    invoke-static {p0, v0}, Lorg/vtlite/reborn/id64/CP569PageUi;->open(Lorg/vtlite/reborn/id64/CP528ListScreen;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)V

    :cond_31
    return-void
.end method

.method public run()V
    .registers 4

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Guarded:Z

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Valid()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-direct {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp583RefreshVisibleDates()V

    const-wide/16 v0, 0xfa

    invoke-virtual {p0, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v0

    if-nez v0, :cond_1e

    :cond_1b
    invoke-static {p0}, Lorg/vtlite/reborn/id64/CP536ListMount;->unmount(Lorg/vtlite/reborn/id64/CP528ListScreen;)Z

    :cond_1e
    return-void
.end method

.method takeSelection()Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;
    .registers 5

    invoke-static {}, Lorg/vtlite/reborn/id64/CP528ListScreen;->requireMain()V

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->selectedRow:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP528ListScreen;->selectedView:Landroid/view/View;

    invoke-direct {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->clearSelection()V

    if-eqz v0, :cond_25

    if-eqz v1, :cond_25

    invoke-direct {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->active()Lorg/vtlite/reborn/id64/CP525ListAdapter;

    move-result-object v2

    if-eqz v2, :cond_25

    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    if-ne v3, p0, :cond_25

    iget v3, v0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->position:I

    invoke-virtual {v2, v1, v3}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->resolve(Landroid/view/View;I)Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    move-result-object v3

    if-ne v3, v0, :cond_25

    iget-object v0, v0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    return-object v0

    :cond_25
    const/4 v0, 0x0

    return-object v0
.end method
