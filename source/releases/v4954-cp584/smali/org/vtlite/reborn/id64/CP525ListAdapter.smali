.class public final Lorg/vtlite/reborn/id64/CP525ListAdapter;
.super Landroid/widget/BaseAdapter;


# instance fields
.field private cleanupFailed:Z

.field private index:Lorg/vtlite/reborn/id64/CP522DialogIndex;

.field private final views:Ljava/util/WeakHashMap;


# direct methods
.method private constructor <init>(Lorg/vtlite/reborn/id64/CP522DialogIndex;)V
    .registers 3

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->index:Lorg/vtlite/reborn/id64/CP522DialogIndex;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->views:Ljava/util/WeakHashMap;

    return-void
.end method

.method private static bidi(I)Z
    .registers 2

    const/16 v0, 0x61c

    if-eq p0, v0, :cond_1f

    const/16 v0, 0x200e

    if-eq p0, v0, :cond_1f

    const/16 v0, 0x200f

    if-eq p0, v0, :cond_1f

    const/16 v0, 0x202a

    if-lt p0, v0, :cond_14

    const/16 v0, 0x202e

    if-le p0, v0, :cond_1f

    :cond_14
    const/16 v0, 0x2066

    if-lt p0, v0, :cond_1d

    const/16 v0, 0x2069

    if-gt p0, v0, :cond_1d

    goto :goto_1f

    :cond_1d
    const/4 p0, 0x0

    goto :goto_20

    :cond_1f
    :goto_1f
    const/4 p0, 0x1

    :goto_20
    return p0
.end method

.method static clean(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 32
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    .line 33
    :cond_a
    :goto_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_5e

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const/16 v4, 0x48

    if-ge v3, v4, :cond_5e

    .line 34
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    .line 35
    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v2, v5

    .line 36
    invoke-static {v3}, Ljava/lang/Character;->isISOControl(I)Z

    move-result v5

    if-nez v5, :cond_a

    invoke-static {v3}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->bidi(I)Z

    move-result v5

    if-nez v5, :cond_a

    const/16 v5, 0x2028

    if-eq v3, v5, :cond_a

    const/16 v5, 0x2029

    if-eq v3, v5, :cond_a

    const v5, 0xd800

    if-lt v3, v5, :cond_40

    const v5, 0xdfff

    if-gt v3, v5, :cond_40

    goto :goto_a

    .line 38
    :cond_40
    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v5

    if-nez v5, :cond_4c

    invoke-static {v3}, Ljava/lang/Character;->isSpaceChar(I)Z

    move-result v5

    if-eqz v5, :cond_4e

    :cond_4c
    const/16 v3, 0x20

    .line 39
    :cond_4e
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v6

    add-int/2addr v5, v6

    if-le v5, v4, :cond_5a

    goto :goto_5e

    .line 40
    :cond_5a
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 42
    :cond_5e
    :goto_5e
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6d

    goto :goto_6e

    :cond_6d
    move-object v0, p0

    :goto_6e
    return-object v0
.end method

.method public static fromPage(Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP525ListAdapter;
    .registers 3

    invoke-static {}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->requireUi()V

    invoke-static {p0}, Lorg/vtlite/reborn/id64/CP522DialogIndex;->fromPage(Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP522DialogIndex;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    new-instance v1, Lorg/vtlite/reborn/id64/CP525ListAdapter;

    invoke-direct {v1, v0}, Lorg/vtlite/reborn/id64/CP525ListAdapter;-><init>(Lorg/vtlite/reborn/id64/CP522DialogIndex;)V

    :cond_f
    return-object v1
.end method

.method private static requireUi()V
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

    const-string v1, "Dialog adapter requires main looper"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public close()V
    .registers 6

    invoke-static {}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->requireUi()V

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->index:Lorg/vtlite/reborn/id64/CP522DialogIndex;

    if-eqz v0, :cond_44

    const/4 v3, 0x1

    iput-boolean v3, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->cleanupFailed:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->index:Lorg/vtlite/reborn/id64/CP522DialogIndex;

    const/4 v3, 0x0

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->views:Ljava/util/WeakHashMap;

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/WeakHashMap;->clear()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_20
    :goto_20
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/vtlite/reborn/id64/CP525RowView;

    if-eqz v2, :cond_20

    :try_start_2e
    invoke-virtual {v2}, Lorg/vtlite/reborn/id64/CP525RowView;->clearBinding()V
    :try_end_31
    .catch Ljava/lang/RuntimeException; {:try_start_2e .. :try_end_31} :catch_32
    .catch Ljava/lang/LinkageError; {:try_start_2e .. :try_end_31} :catch_32

    goto :goto_20

    :catch_32
    move-exception v4

    const/4 v3, 0x1

    :try_start_34
    const/16 v4, 0x8

    invoke-virtual {v2, v4}, Landroid/view/View;->setVisibility(I)V
    :try_end_39
    .catch Ljava/lang/RuntimeException; {:try_start_34 .. :try_end_39} :catch_3a
    .catch Ljava/lang/LinkageError; {:try_start_34 .. :try_end_39} :catch_3a

    goto :goto_20

    :catch_3a
    move-exception v4

    goto :goto_20

    :cond_3c
    :try_start_3c
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetInvalidated()V
    :try_end_3f
    .catch Ljava/lang/RuntimeException; {:try_start_3c .. :try_end_3f} :catch_40
    .catch Ljava/lang/LinkageError; {:try_start_3c .. :try_end_3f} :catch_40

    goto :goto_42

    :catch_40
    move-exception v4

    const/4 v3, 0x1

    :goto_42
    iput-boolean v3, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->cleanupFailed:Z

    :cond_44
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->cleanupFailed:Z

    if-eqz v0, :cond_50

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Dialog adapter cleanup incomplete"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_50
    return-void
.end method

.method public getCount()I
    .registers 3

    invoke-static {}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->requireUi()V

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->index:Lorg/vtlite/reborn/id64/CP522DialogIndex;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/CP522DialogIndex;->size()I

    move-result v1

    :cond_c
    return v1
.end method

.method public getItem(I)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->rowAt(I)Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .registers 4

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 8

    invoke-static {}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->requireUi()V

    instance-of v0, p2, Lorg/vtlite/reborn/id64/CP525RowView;

    if-eqz v0, :cond_e

    move-object v0, p2

    check-cast v0, Lorg/vtlite/reborn/id64/CP525RowView;

    iget-object v1, v0, Lorg/vtlite/reborn/id64/CP525RowView;->owner:Lorg/vtlite/reborn/id64/CP525ListAdapter;

    if-eq v1, p0, :cond_17

    :cond_e
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v0, Lorg/vtlite/reborn/id64/CP525RowView;

    invoke-direct {v0, v1, p0}, Lorg/vtlite/reborn/id64/CP525RowView;-><init>(Landroid/content/Context;Lorg/vtlite/reborn/id64/CP525ListAdapter;)V

    :cond_17
    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->index:Lorg/vtlite/reborn/id64/CP522DialogIndex;

    if-eqz v1, :cond_22

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->views:Ljava/util/WeakHashMap;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, v0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_22
    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->rowAt(I)Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    move-result-object v1

    const/4 v2, 0x0

    iput-object v2, v0, Lorg/vtlite/reborn/id64/CP525RowView;->row:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    const-string v2, ""

    if-eqz v1, :cond_37

    iget-object v2, v1, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->title:Ljava/lang/String;

    invoke-static {v2}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_37

    const-string v2, "\u0414\u0438\u0430\u043b\u043e\u0433 \u0431\u0435\u0437 \u043d\u0430\u0437\u0432\u0430\u043d\u0438\u044f"

    :cond_37
    invoke-virtual {v0, v2, v1}, Lorg/vtlite/reborn/id64/CP525RowView;->bind(Ljava/lang/String;Lorg/vtlite/reborn/id64/DialogPageModel$Row;)V

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->rowAt(I)Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    move-result-object v3

    if-ne v1, v3, :cond_45

    if-eqz v1, :cond_45

    iput-object v1, v0, Lorg/vtlite/reborn/id64/CP525RowView;->row:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    return-object v0

    :cond_45
    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/CP525RowView;->clearBinding()V

    return-object v0
.end method

.method public hasStableIds()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public resolve(Landroid/view/View;I)Lorg/vtlite/reborn/id64/DialogPageModel$Row;
    .registers 7

    invoke-static {}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->requireUi()V

    const/4 v0, 0x0

    instance-of v1, p1, Lorg/vtlite/reborn/id64/CP525RowView;

    if-eqz v1, :cond_19

    check-cast p1, Lorg/vtlite/reborn/id64/CP525RowView;

    iget-object v1, p1, Lorg/vtlite/reborn/id64/CP525RowView;->owner:Lorg/vtlite/reborn/id64/CP525ListAdapter;

    if-ne v1, p0, :cond_19

    iget-object v1, p1, Lorg/vtlite/reborn/id64/CP525RowView;->row:Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    if-eqz v1, :cond_19

    invoke-virtual {p0, p2}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->rowAt(I)Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    move-result-object v2

    if-ne v1, v2, :cond_19

    move-object v0, v1

    :cond_19
    return-object v0
.end method

.method public rowAt(I)Lorg/vtlite/reborn/id64/DialogPageModel$Row;
    .registers 5

    invoke-static {}, Lorg/vtlite/reborn/id64/CP525ListAdapter;->requireUi()V

    const/4 v0, 0x0

    if-ltz p1, :cond_1e

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP525ListAdapter;->index:Lorg/vtlite/reborn/id64/CP522DialogIndex;

    if-eqz v1, :cond_1e

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v2}, Lorg/vtlite/reborn/id64/CP522DialogIndex;->window(II)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1e

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-eqz v2, :cond_1e

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    :cond_1e
    return-object v0
.end method
