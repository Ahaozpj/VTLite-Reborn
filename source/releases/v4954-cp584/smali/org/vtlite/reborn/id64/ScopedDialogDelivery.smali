.class public final Lorg/vtlite/reborn/id64/ScopedDialogDelivery;
.super Ljava/lang/Object;
.source "ScopedDialogDelivery.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;,
        Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;
    }
.end annotation


# instance fields
.field private closed:Z

.field private page:Lorg/vtlite/reborn/id64/DialogPageModel$Page;

.field private session:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

.field private view:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;


# direct methods
.method private constructor <init>(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;Lorg/vtlite/reborn/id64/DialogPageModel$Page;)V
    .registers 4

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    iput-object p1, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->session:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->view:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;

    iput-object p3, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->page:Lorg/vtlite/reborn/id64/DialogPageModel$Page;

    return-void
.end method

.method private static current(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;)Z
    .registers 4

    const/4 v0, 0x0

    if-eqz p0, :cond_19

    if-nez p1, :cond_6

    goto :goto_19

    .line 18
    :cond_6
    :try_start_6
    invoke-interface {p0}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;->isCurrent()Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-interface {p1}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;->isCurrent()Z

    move-result p1

    if-eqz p1, :cond_19

    invoke-interface {p0}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;->isCurrent()Z

    move-result p0
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_16} :catch_19
    .catch Ljava/lang/LinkageError; {:try_start_6 .. :try_end_16} :catch_19

    if-eqz p0, :cond_19

    const/4 v0, 0x1

    :catch_19
    :cond_19
    :goto_19
    return v0
.end method

.method public static stage(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;Ljava/lang/String;)Lorg/vtlite/reborn/id64/ScopedDialogDelivery;
    .registers 4

    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public declared-synchronized invalidate()V
    .registers 2

    monitor-enter p0

    const/4 v0, 0x1

    .line 42
    :try_start_2
    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->closed:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->page:Lorg/vtlite/reborn/id64/DialogPageModel$Page;

    iput-object v0, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->session:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iput-object v0, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->view:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;
    :try_end_b
    .catchall {:try_start_2 .. :try_end_b} :catchall_d

    .line 43
    monitor-exit p0

    return-void

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized isClosed()Z
    .registers 2

    monitor-enter p0

    .line 44
    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->closed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_5

    monitor-exit p0

    return v0

    :catchall_5
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized take(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;)Lorg/vtlite/reborn/id64/DialogPageModel$Page;
    .registers 7

    monitor-enter p0

    .line 35
    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->closed:Z
    :try_end_3
    .catchall {:try_start_1 .. :try_end_3} :catchall_20

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    monitor-exit p0

    return-object v1

    .line 36
    :cond_8
    :try_start_8
    iget-object v0, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->session:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iget-object v2, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->view:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;

    iget-object v3, p0, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->page:Lorg/vtlite/reborn/id64/DialogPageModel$Page;

    .line 37
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->invalidate()V

    if-ne v0, p1, :cond_1e

    if-ne v2, p2, :cond_1e

    .line 38
    invoke-static {v0, v2}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->current(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;)Z

    move-result p1
    :try_end_19
    .catchall {:try_start_8 .. :try_end_19} :catchall_20

    if-nez p1, :cond_1c

    goto :goto_1e

    .line 39
    :cond_1c
    monitor-exit p0

    return-object v3

    .line 38
    :cond_1e
    :goto_1e
    monitor-exit p0

    return-object v1

    :catchall_20
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 45
    const-string p0, "ScopedDialogDelivery(REDACTED)"

    return-object p0
.end method
