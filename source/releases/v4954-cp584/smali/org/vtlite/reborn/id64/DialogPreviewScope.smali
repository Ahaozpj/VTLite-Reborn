.class public final Lorg/vtlite/reborn/id64/DialogPreviewScope;
.super Ljava/lang/Object;
.source "DialogPreviewScope.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;
    }
.end annotation


# static fields
.field private static final ACTIVE:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Lorg/vtlite/reborn/id64/DialogPreviewScope;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOCK:Ljava/lang/Object;


# instance fields
.field private closed:Z

.field private owner:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

.field private page:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

.field private screen:Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 15
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->LOCK:Ljava/lang/Object;

    .line 16
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->ACTIVE:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 4

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    sget-object v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 24
    :try_start_6
    sget-object v1, Lorg/vtlite/reborn/id64/DialogPreviewScope;->ACTIVE:Ljava/util/WeakHashMap;

    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v1, p0, v2}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    monitor-exit v0

    .line 26
    return-void

    .line 25
    :catchall_f
    move-exception v1

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_6 .. :try_end_11} :catchall_f

    throw v1
.end method

.method public static accountBoundary()V
    .registers 3

    .line 101
    sget-object v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 102
    :try_start_3
    sget-object v1, Lorg/vtlite/reborn/id64/DialogPreviewScope;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_d
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1f

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/vtlite/reborn/id64/DialogPreviewScope;

    .line 103
    if-eqz v2, :cond_d

    invoke-direct {v2}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->closeLocked()V

    goto :goto_d

    .line 104
    :cond_1f
    sget-object v1, Lorg/vtlite/reborn/id64/DialogPreviewScope;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {v1}, Ljava/util/WeakHashMap;->clear()V

    .line 105
    monitor-exit v0

    .line 106
    return-void

    .line 105
    :catchall_26
    move-exception v1

    monitor-exit v0
    :try_end_28
    .catchall {:try_start_3 .. :try_end_28} :catchall_26

    throw v1
.end method

.method private closeLocked()V
    .registers 3

    .line 84
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->closed:Z

    .line 85
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->page:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    .line 86
    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->owner:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    .line 87
    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->screen:Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;

    .line 88
    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->screen:Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;

    .line 89
    if-eqz v1, :cond_11

    invoke-interface {v1}, Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;->requestRemoval()V

    .line 90
    :cond_11
    return-void
.end method

.method public static cp556IsStagedFailure(Ljava/lang/Throwable;)Z
    .registers 5

    .line 42
    const/4 v0, 0x0

    move v1, v0

    :goto_2
    if-eqz p0, :cond_2d

    const/16 v2, 0x10

    if-ge v1, v2, :cond_2d

    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "org.json.JSONException"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 44
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "REBORN_DIALOGS_CONFIRMED_PROFILE_ID64_UNSUPPORTED;CP359=CP556_PAGE_STAGED"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 45
    const/4 p0, 0x1

    return p0

    .line 42
    :cond_26
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_2

    .line 47
    :cond_2d
    return v0
.end method

.method public static isPreviewFailure(Ljava/lang/Throwable;)Z
    .registers 5

    .line 42
    const/4 v0, 0x0

    move v1, v0

    :goto_2
    if-eqz p0, :cond_2d

    const/16 v2, 0x10

    if-ge v1, v2, :cond_2d

    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    const-string v3, "org.json.JSONException"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 44
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v2

    const-string v3, "REBORN_DIALOGS_CONFIRMED_PROFILE_ID64_UNSUPPORTED;CP359=PREVIEW_READY"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_26

    .line 45
    const/4 p0, 0x1

    return p0

    .line 42
    :cond_26
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_2

    .line 47
    :cond_2d
    return v0
.end method


# virtual methods
.method bind(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;)I
    .registers 6

    .line 58
    const/4 v0, -0x1

    if-eqz p2, :cond_2f

    invoke-virtual {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368StillCurrent()Z

    move-result v1

    if-nez v1, :cond_a

    goto :goto_2f

    .line 59
    :cond_a
    sget-object v1, Lorg/vtlite/reborn/id64/DialogPreviewScope;->LOCK:Ljava/lang/Object;

    monitor-enter v1

    .line 60
    :try_start_d
    iget-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->closed:Z

    if-nez v2, :cond_2a

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->owner:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    if-ne v2, p1, :cond_2a

    iget-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->page:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    if-eqz p1, :cond_2a

    iget-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->screen:Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;

    if-eqz p1, :cond_1e

    goto :goto_2a

    .line 61
    :cond_1e
    iput-object p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->screen:Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;

    .line 62
    iget-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->page:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    iget-object p1, p1, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->labels:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    monitor-exit v1

    return p1

    .line 60
    :cond_2a
    :goto_2a
    monitor-exit v1

    return v0

    .line 63
    :catchall_2c
    move-exception p1

    monitor-exit v1
    :try_end_2e
    .catchall {:try_start_d .. :try_end_2e} :catchall_2c

    throw p1

    .line 58
    :cond_2f
    :goto_2f
    return v0
.end method

.method boundTo(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;)Z
    .registers 6

    .line 67
    invoke-virtual {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368StillCurrent()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    .line 68
    :cond_8
    sget-object v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 69
    :try_start_b
    iget-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->closed:Z

    if-nez v2, :cond_1c

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->page:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    if-eqz v2, :cond_1c

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->screen:Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;

    if-ne v2, p2, :cond_1c

    iget-object p2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->owner:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    if-ne p2, p1, :cond_1c

    const/4 v1, 0x1

    :cond_1c
    monitor-exit v0

    return v1

    .line 70
    :catchall_1e
    move-exception p1

    monitor-exit v0
    :try_end_20
    .catchall {:try_start_b .. :try_end_20} :catchall_1e

    throw p1
.end method

.method public close()V
    .registers 3

    .line 93
    sget-object v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 94
    :try_start_3
    sget-object v1, Lorg/vtlite/reborn/id64/DialogPreviewScope;->ACTIVE:Ljava/util/WeakHashMap;

    invoke-virtual {v1, p0}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    invoke-direct {p0}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->closeLocked()V

    .line 96
    monitor-exit v0

    .line 97
    return-void

    .line 96
    :catchall_d
    move-exception v1

    monitor-exit v0
    :try_end_f
    .catchall {:try_start_3 .. :try_end_f} :catchall_d

    throw v1
.end method

.method draw(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;)Z
    .registers 6

    .line 74
    invoke-virtual {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368StillCurrent()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    .line 75
    :cond_8
    sget-object v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 76
    :try_start_b
    iget-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->closed:Z

    if-nez v2, :cond_26

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->page:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    if-eqz v2, :cond_26

    if-eqz p2, :cond_26

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->screen:Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;

    if-ne v2, p2, :cond_26

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->owner:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    if-eq v2, p1, :cond_1e

    goto :goto_26

    .line 78
    :cond_1e
    iget-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->page:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    invoke-interface {p2, p1}, Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;->paint(Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;)V

    .line 79
    monitor-exit v0

    const/4 p1, 0x1

    return p1

    .line 77
    :cond_26
    :goto_26
    monitor-exit v0

    return v1

    .line 80
    :catchall_28
    move-exception p1

    monitor-exit v0
    :try_end_2a
    .catchall {:try_start_b .. :try_end_2a} :catchall_28

    throw p1
.end method

.method public peerForTap(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;I)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;
    .registers 7

    invoke-virtual {p0, p1, p2}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->boundTo(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;)Z

    move-result v0

    if-eqz v0, :cond_25

    sget-object v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_9
    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->closed:Z

    if-nez v1, :cond_1f

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->owner:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    if-ne v1, p1, :cond_1f

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->screen:Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;

    if-ne v1, p2, :cond_1f

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->page:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    if-eqz v1, :cond_1f

    invoke-virtual {v1, p3}, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->peerAt(I)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :cond_1f
    const/4 v1, 0x0

    monitor-exit v0

    return-object v1
    :try_end_22
    .catchall {:try_start_9 .. :try_end_22} :catchall_22

    :catchall_22
    move-exception v1

    monitor-exit v0

    throw v1

    :cond_25
    const/4 v0, 0x0

    return-object v0
.end method

.method public ready(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)Z
    .registers 5

    .line 51
    invoke-virtual {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368StillCurrent()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    .line 52
    :cond_8
    sget-object v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 53
    :try_start_b
    iget-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->closed:Z

    if-nez v2, :cond_1c

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->page:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    if-eqz v2, :cond_1c

    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->owner:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    if-ne v2, p1, :cond_1c

    iget-object p1, p0, Lorg/vtlite/reborn/id64/DialogPreviewScope;->screen:Lorg/vtlite/reborn/id64/DialogPreviewScope$Screen;

    if-nez p1, :cond_1c

    const/4 v1, 0x1

    :cond_1c
    monitor-exit v0

    return v1

    .line 54
    :catchall_1e
    move-exception p1

    monitor-exit v0
    :try_end_20
    .catchall {:try_start_b .. :try_end_20} :catchall_1e

    throw p1
.end method

.method public stage(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    const-string v0, "DIAGNOSTIC_ONLY"

    return-object v0
.end method
