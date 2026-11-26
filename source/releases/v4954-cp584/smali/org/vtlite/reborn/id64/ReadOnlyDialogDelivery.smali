.class public final Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;
.super Ljava/lang/Object;
.source "ReadOnlyDialogDelivery.java"


# instance fields
.field private closed:Z

.field private dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

.field private origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

.field private preview:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

.field private view:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;


# direct methods
.method private constructor <init>(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;)V
    .registers 5

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iput-object p3, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->view:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;

    iput-object p4, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->preview:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    return-void
.end method

.method private static live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z
    .registers 2

    const/4 v0, 0x0

    if-eqz p0, :cond_b

    .line 18
    :try_start_3
    invoke-interface {p0}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;->isCurrent()Z

    move-result p0
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_7} :catch_b
    .catch Ljava/lang/LinkageError; {:try_start_3 .. :try_end_7} :catch_b

    if-eqz p0, :cond_b

    const/4 v0, 0x1

    nop

    :catch_b
    :cond_b
    return v0
.end method

.method private static live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;)Z
    .registers 2

    const/4 v0, 0x0

    if-eqz p0, :cond_b

    .line 22
    :try_start_3
    invoke-interface {p0}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;->isCurrent()Z

    move-result p0
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_7} :catch_b
    .catch Ljava/lang/LinkageError; {:try_start_3 .. :try_end_7} :catch_b

    if-eqz p0, :cond_b

    const/4 v0, 0x1

    nop

    :catch_b
    :cond_b
    return v0
.end method

.method public static stage(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;Ljava/lang/String;)Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;
    .registers 5

    const/4 v0, 0x0

    return-object v0
.end method

.method private valid()Z
    .registers 3

    .line 26
    iget-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0, v1}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->cp510SameGeneration(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->closed:Z

    if-nez v0, :cond_30

    iget-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->view:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;)Z

    move-result v0

    if-eqz v0, :cond_30

    iget-object p0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {p0}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result p0

    if-eqz p0, :cond_30

    const/4 p0, 0x1

    goto :goto_31

    :cond_30
    const/4 p0, 0x0

    :goto_31
    return p0
.end method


# virtual methods
.method public declared-synchronized invalidate()V
    .registers 2

    monitor-enter p0

    const/4 v0, 0x1

    .line 54
    :try_start_2
    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->closed:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iput-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iput-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->view:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;

    iput-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->preview:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;
    :try_end_d
    .catchall {:try_start_2 .. :try_end_d} :catchall_f

    .line 55
    monitor-exit p0

    return-void

    :catchall_f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isClosed()Z
    .registers 2

    monitor-enter p0

    .line 56
    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->closed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized take(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;)Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;
    .registers 8

    monitor-enter p0

    .line 45
    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->closed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_39

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    monitor-exit p0

    return-object v1

    .line 46
    :cond_8
    :try_start_8
    iget-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    if-ne v0, p1, :cond_16

    iget-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    if-ne v0, p2, :cond_16

    iget-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->view:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;

    if-ne v0, p3, :cond_16

    const/4 v0, 0x1

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    .line 47
    :goto_17
    invoke-direct {p0}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->valid()Z

    move-result v2

    .line 48
    iget-object v3, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->preview:Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    .line 49
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->invalidate()V

    if-eqz v0, :cond_37

    if-eqz v2, :cond_37

    .line 50
    invoke-static {p1}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result p1

    if-eqz p1, :cond_37

    invoke-static {p2}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result p1

    if-eqz p1, :cond_37

    .line 51
    invoke-static {p3}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;)Z

    move-result p1
    :try_end_34
    .catchall {:try_start_8 .. :try_end_34} :catchall_39

    if-eqz p1, :cond_37

    move-object v1, v3

    .line 50
    :cond_37
    monitor-exit p0

    return-object v1

    :catchall_39
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 57
    const-string p0, "ReadOnlyDialogDelivery(REDACTED)"

    return-object p0
.end method
