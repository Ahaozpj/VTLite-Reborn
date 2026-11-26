.class public final Lorg/vtlite/reborn/id64/DialogViewRequestToken;
.super Ljava/lang/Object;
.source "DialogViewRequestToken.java"

# interfaces
.implements Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/id64/DialogViewRequestToken$Slot;
    }
.end annotation


# instance fields
.field private attempted:Z

.field private bound:Z

.field private cp368Delivery:Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;

.field private cp368RenderSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

.field public final cp369Scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

.field private cp517Claimed:Z

.field private cp555Pending:Lorg/vtlite/reborn/id64/CP555PageHandoff;

.field private cp560Screen:Ljava/lang/ref/WeakReference;

.field private volatile current:Z

.field private dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

.field private origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

.field private pending:Lorg/vtlite/reborn/id64/ScopedDialogDelivery;

.field private receipt:Z

.field private receiptSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/vtlite/reborn/id64/DialogPreviewScope;

    invoke-direct {v0}, Lorg/vtlite/reborn/id64/DialogPreviewScope;-><init>()V

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp369Scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    return-void
.end method

.method synthetic constructor <init>(Lorg/vtlite/reborn/id64/DialogViewRequestToken$1;)V
    .registers 2

    .line 5
    invoke-direct {p0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)V
    .registers 1

    .line 5
    invoke-direct {p0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->revoke()V

    return-void
.end method

.method private declared-synchronized cp559Eligible(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    if-nez v0, :cond_a

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Current(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z

    move-result v0

    goto :goto_b

    :cond_a
    const/4 v0, 0x0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    :goto_b
    monitor-exit p0

    return v0

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private cp560NotifyRevoked()V
    .registers 4

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp560Screen:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp560Screen:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1d

    :try_start_7
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1d

    check-cast v0, Lorg/vtlite/reborn/id64/CP528ListScreen;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eqz v1, :cond_1d

    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    invoke-virtual {v2, v0}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z
    :try_end_1d
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_1d} :catch_1e
    .catch Ljava/lang/LinkageError; {:try_start_7 .. :try_end_1d} :catch_1e

    :cond_1d
    return-void

    :catch_1e
    move-exception v0

    return-void
.end method

.method private declared-synchronized cp561Commit(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP555PageHandoff;)Z
    .registers 5

    monitor-enter p0

    :try_start_1
    const/4 v0, 0x0

    if-eqz p2, :cond_1b

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    if-eqz v1, :cond_1b

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Pending:Lorg/vtlite/reborn/id64/CP555PageHandoff;

    if-nez v1, :cond_1b

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Current(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z

    move-result v1

    if-eqz v1, :cond_1b

    invoke-virtual {p2, p0}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->valid(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)Z

    move-result v1

    if-eqz v1, :cond_1b

    iput-object p2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Pending:Lorg/vtlite/reborn/id64/CP555PageHandoff;

    const/4 v0, 0x1
    :try_end_1b
    .catchall {:try_start_1 .. :try_end_1b} :catchall_1d

    :cond_1b
    monitor-exit p0

    return v0

    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized cp561Reserve(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z
    .registers 4

    monitor-enter p0

    :try_start_1
    const/4 v0, 0x0

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    if-nez v1, :cond_f

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Current(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z

    move-result v1

    if-eqz v1, :cond_f

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    :cond_f
    monitor-exit p0

    return v0

    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private static live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z
    .registers 2

    const/4 v0, 0x0

    if-eqz p0, :cond_b

    .line 15
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

.method private declared-synchronized revoke()V
    .registers 3

    monitor-enter p0

    const/4 v0, 0x0

    .line 66
    :try_start_2
    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Pending:Lorg/vtlite/reborn/id64/CP555PageHandoff;

    invoke-direct {p0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp560NotifyRevoked()V

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp369Scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    invoke-virtual {v1}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->close()V

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368Delivery:Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;

    if-eqz v1, :cond_15

    invoke-virtual {v1}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->invalidate()V

    :cond_15
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368Delivery:Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368RenderSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    .line 67
    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->pending:Lorg/vtlite/reborn/id64/ScopedDialogDelivery;

    if-eqz v1, :cond_21

    invoke-virtual {v1}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->invalidate()V

    :cond_21
    const/4 v1, 0x0

    .line 68
    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->pending:Lorg/vtlite/reborn/id64/ScopedDialogDelivery;

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->receipt:Z

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->receiptSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;
    :try_end_2c
    .catchall {:try_start_2 .. :try_end_2c} :catchall_2e

    .line 69
    monitor-exit p0

    return-void

    :catchall_2e
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public declared-synchronized bindOrigin(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)V
    .registers 3

    monitor-enter p0

    .line 19
    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->bound:Z

    if-nez v0, :cond_17

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-nez v0, :cond_a

    goto :goto_17

    :cond_a
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->bound:Z

    .line 21
    invoke-static {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_15

    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;
    :try_end_15
    .catchall {:try_start_1 .. :try_end_15} :catchall_19

    .line 22
    :cond_15
    monitor-exit p0

    return-void

    .line 19
    :cond_17
    :goto_17
    monitor-exit p0

    return-void

    :catchall_19
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized cp368OfferReadOnly(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    monitor-enter p0

    .line 78
    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-nez v0, :cond_9

    const-string p1, "VIEW_REVOKED"
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_65

    monitor-exit p0

    return-object p1

    .line 79
    :cond_9
    :try_start_9
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    if-eqz v0, :cond_11

    const-string p1, "ALREADY_ATTEMPTED"
    :try_end_f
    .catchall {:try_start_9 .. :try_end_f} :catchall_65

    monitor-exit p0

    return-object p1

    :cond_11
    const/4 v0, 0x1

    .line 80
    :try_start_12
    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    .line 81
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_61

    invoke-static {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_61

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-nez v0, :cond_2b

    goto :goto_61

    .line 82
    :cond_2b
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0, p1, p0, p2}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->stage(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;Ljava/lang/String;)Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;

    move-result-object p2

    if-nez p2, :cond_37

    .line 83
    const-string p1, "PAGE_REJECTED"
    :try_end_35
    .catchall {:try_start_12 .. :try_end_35} :catchall_65

    monitor-exit p0

    return-object p1

    .line 84
    :cond_37
    :try_start_37
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_5a

    invoke-static {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_5a

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-nez v0, :cond_52

    goto :goto_5a

    .line 87
    :cond_52
    iput-object p2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368Delivery:Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;

    .line 88
    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368RenderSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    .line 89
    const-string p1, "PREVIEW_READY"
    :try_end_58
    .catchall {:try_start_37 .. :try_end_58} :catchall_65

    monitor-exit p0

    return-object p1

    .line 85
    :cond_5a
    :goto_5a
    :try_start_5a
    invoke-virtual {p2}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->invalidate()V

    const-string p1, "REVOKED_AFTER_STAGE"
    :try_end_5f
    .catchall {:try_start_5a .. :try_end_5f} :catchall_65

    monitor-exit p0

    return-object p1

    .line 81
    :cond_61
    :goto_61
    :try_start_61
    const-string p1, "SESSION_REJECTED"
    :try_end_63
    .catchall {:try_start_61 .. :try_end_63} :catchall_65

    monitor-exit p0

    return-object p1

    :catchall_65
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized cp368StillCurrent()Z
    .registers 3

    monitor-enter p0

    .line 102
    :try_start_1
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368RenderSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0, v1}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->cp510SameGeneration(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_29

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v0, :cond_29

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_29

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368RenderSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_29

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0
    :try_end_25
    .catchall {:try_start_1 .. :try_end_25} :catchall_2c

    if-eqz v0, :cond_29

    const/4 v0, 0x1

    goto :goto_2a

    :cond_29
    const/4 v0, 0x0

    :goto_2a
    monitor-exit p0

    return v0

    :catchall_2c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized cp368TakeReadOnly()Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;
    .registers 5

    monitor-enter p0

    .line 92
    :try_start_1
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368Delivery:Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;

    .line 93
    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368RenderSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    const/4 v2, 0x0

    .line 94
    iput-object v2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp368Delivery:Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;

    if-eqz v0, :cond_25

    .line 95
    iget-boolean v3, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v3, :cond_25

    iget-object v3, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v3}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v3

    if-eqz v3, :cond_25

    invoke-static {v1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v3

    if-nez v3, :cond_1d

    goto :goto_25

    .line 99
    :cond_1d
    iget-object v2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-virtual {v0, v2, v1, p0}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->take(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;)Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    move-result-object v0
    :try_end_23
    .catchall {:try_start_1 .. :try_end_23} :catchall_2c

    monitor-exit p0

    return-object v0

    :cond_25
    :goto_25
    if-eqz v0, :cond_2a

    .line 96
    :try_start_27
    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/ReadOnlyDialogDelivery;->invalidate()V
    :try_end_2a
    .catchall {:try_start_27 .. :try_end_2a} :catchall_2c

    .line 97
    :cond_2a
    monitor-exit p0

    return-object v2

    :catchall_2c
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public cp369Ready()Z
    .registers 2

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp369Scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    invoke-virtual {v0, p0}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->ready(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)Z

    move-result v0

    return v0
.end method

.method public cp369Stage(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp369Scope:Lorg/vtlite/reborn/id64/DialogPreviewScope;

    invoke-virtual {v0, p0, p1, p2}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->stage(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized cp517Claim(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z
    .registers 4

    monitor-enter p0

    :try_start_1
    const/4 v0, 0x0

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v1, :cond_1d

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->bound:Z

    if-eqz v1, :cond_1d

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    if-nez v1, :cond_1d

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp517Claimed:Z

    if-nez v1, :cond_1d

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v1, p1}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->cp510SameGeneration(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v1

    if-eqz v1, :cond_1d

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp517Claimed:Z

    :cond_1d
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_1f

    return v0

    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized cp555Current(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z
    .registers 4

    monitor-enter p0

    :try_start_1
    const/4 v0, 0x0

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v1, :cond_1e

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp517Claimed:Z

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v1, p1}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->cp510SameGeneration(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v1

    if-eqz v1, :cond_1e

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v1

    if-eqz v1, :cond_1e

    invoke-static {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0
    :try_end_1e
    .catchall {:try_start_1 .. :try_end_1e} :catchall_20

    :cond_1e
    monitor-exit p0

    return v0

    :catchall_20
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public cp555Stage(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 7

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp561Reserve(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z

    move-result v0

    if-eqz v0, :cond_11

    invoke-static {p0, p1, p2, p3, p4}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->create(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;Ljava/lang/String;)Lorg/vtlite/reborn/id64/CP555PageHandoff;

    move-result-object v1

    if-eqz v1, :cond_11

    invoke-direct {p0, p1, v1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp561Commit(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP555PageHandoff;)Z

    move-result v0

    return v0

    :cond_11
    const/4 v0, 0x0

    return v0
.end method

.method declared-synchronized cp555Take()Lorg/vtlite/reborn/id64/CP555PageHandoff;
    .registers 3

    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Pending:Lorg/vtlite/reborn/id64/CP555PageHandoff;

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Pending:Lorg/vtlite/reborn/id64/CP555PageHandoff;

    if-eqz v0, :cond_e

    invoke-virtual {v0, p0}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->valid(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)Z

    move-result v1

    if-nez v1, :cond_f

    :cond_e
    const/4 v0, 0x0
    :try_end_f
    .catchall {:try_start_1 .. :try_end_f} :catchall_11

    :cond_f
    monitor-exit p0

    return-object v0

    :catchall_11
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public cp559Probe(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;Ljava/lang/String;)Z
    .registers 7

    const/4 v0, 0x0

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp559Eligible(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-static {p0, p1, p2, p3, p4}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->create(Lorg/vtlite/reborn/id64/DialogViewRequestToken;Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lorg/vtlite/reborn/id64/CP518ImOrigin;Ljava/lang/Object;Ljava/lang/String;)Lorg/vtlite/reborn/id64/CP555PageHandoff;

    move-result-object v1

    if-eqz v1, :cond_17

    invoke-virtual {v1, p0}, Lorg/vtlite/reborn/id64/CP555PageHandoff;->valid(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp559Eligible(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z

    move-result v0

    :cond_17
    return v0
.end method

.method declared-synchronized cp560Register(Lorg/vtlite/reborn/id64/CP528ListScreen;)Z
    .registers 5

    monitor-enter p0

    :try_start_1
    const/4 v0, 0x0

    if-eqz p1, :cond_1d

    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v1, :cond_1d

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp560Screen:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_15

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_15

    if-ne v2, p1, :cond_1d

    goto :goto_1c

    :cond_15
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp560Screen:Ljava/lang/ref/WeakReference;

    :goto_1c
    const/4 v0, 0x1
    :try_end_1d
    .catchall {:try_start_1 .. :try_end_1d} :catchall_1f

    :cond_1d
    monitor-exit p0

    return v0

    :catchall_1f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized cp569DiscardPending()V
    .registers 2

    monitor-enter p0

    :try_start_1
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->cp555Pending:Lorg/vtlite/reborn/id64/CP555PageHandoff;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isCurrent()Z
    .registers 1

    .line 13
    iget-boolean p0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    return p0
.end method

.method public declared-synchronized offer(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Ljava/lang/String;)V
    .registers 4

    monitor-enter p0

    .line 24
    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    if-nez v0, :cond_4c

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-nez v0, :cond_a

    goto :goto_4c

    :cond_a
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    .line 26
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_4a

    invoke-static {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_4a

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-nez v0, :cond_24

    goto :goto_4a

    .line 27
    :cond_24
    invoke-static {p1, p0, p2}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->stage(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;Ljava/lang/String;)Lorg/vtlite/reborn/id64/ScopedDialogDelivery;

    move-result-object p2
    :try_end_28
    .catchall {:try_start_1 .. :try_end_28} :catchall_4e

    if-nez p2, :cond_2c

    .line 28
    monitor-exit p0

    return-void

    .line 29
    :cond_2c
    :try_start_2c
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v0, :cond_45

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_45

    invoke-static {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-nez v0, :cond_3f

    goto :goto_45

    .line 30
    :cond_3f
    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->pending:Lorg/vtlite/reborn/id64/ScopedDialogDelivery;
    :try_end_43
    .catchall {:try_start_2c .. :try_end_43} :catchall_4e

    .line 31
    monitor-exit p0

    return-void

    .line 29
    :cond_45
    :goto_45
    :try_start_45
    invoke-virtual {p2}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->invalidate()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_4e

    monitor-exit p0

    return-void

    .line 26
    :cond_4a
    :goto_4a
    monitor-exit p0

    return-void

    .line 24
    :cond_4c
    :goto_4c
    monitor-exit p0

    return-void

    :catchall_4e
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized offerReceipt(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Ljava/lang/String;)V
    .registers 3

    monitor-enter p0

    .line 45
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->offerReceiptStatus(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Ljava/lang/String;)Ljava/lang/String;
    :try_end_4
    .catchall {:try_start_1 .. :try_end_4} :catchall_6

    .line 46
    monitor-exit p0

    return-void

    .line 44
    :catchall_6
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized offerReceiptStatus(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    monitor-enter p0

    .line 49
    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-nez v0, :cond_9

    const-string p1, "VIEW_REVOKED"
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_75

    monitor-exit p0

    return-object p1

    .line 50
    :cond_9
    :try_start_9
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    if-eqz v0, :cond_11

    const-string p1, "ALREADY_ATTEMPTED"
    :try_end_f
    .catchall {:try_start_9 .. :try_end_f} :catchall_75

    monitor-exit p0

    return-object p1

    .line 51
    :cond_11
    const/4 v0, 0x1

    :try_start_12
    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->attempted:Z

    .line 52
    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    if-nez v1, :cond_1c

    const-string p1, "ORIGIN_MISSING"
    :try_end_1a
    .catchall {:try_start_12 .. :try_end_1a} :catchall_75

    monitor-exit p0

    return-object p1

    .line 53
    :cond_1c
    :try_start_1c
    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v1

    if-nez v1, :cond_28

    const-string p1, "ORIGIN_STALE"
    :try_end_26
    .catchall {:try_start_1c .. :try_end_26} :catchall_75

    monitor-exit p0

    return-object p1

    .line 54
    :cond_28
    if-nez p1, :cond_2e

    :try_start_2a
    const-string p1, "DISPATCH_MISSING"
    :try_end_2c
    .catchall {:try_start_2a .. :try_end_2c} :catchall_75

    monitor-exit p0

    return-object p1

    .line 55
    :cond_2e
    :try_start_2e
    invoke-static {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v1

    if-eqz v1, :cond_71

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v1

    if-nez v1, :cond_3d

    goto :goto_71

    .line 56
    :cond_3d
    invoke-static {p1, p0, p2}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->stage(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;Ljava/lang/String;)Lorg/vtlite/reborn/id64/ScopedDialogDelivery;

    move-result-object p2

    .line 57
    if-nez p2, :cond_47

    const-string p1, "MODEL_OR_SESSION_REJECTED"
    :try_end_45
    .catchall {:try_start_2e .. :try_end_45} :catchall_75

    monitor-exit p0

    return-object p1

    .line 58
    :cond_47
    :try_start_47
    invoke-virtual {p2}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->invalidate()V

    .line 59
    iget-boolean p2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz p2, :cond_6d

    iget-object p2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {p2}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result p2

    if-eqz p2, :cond_6d

    invoke-static {p1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result p2

    if-eqz p2, :cond_6d

    iget-object p2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {p2}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result p2

    if-nez p2, :cond_65

    goto :goto_6d

    .line 60
    :cond_65
    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->receiptSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    .line 61
    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->receipt:Z

    .line 62
    const-string p1, "RECEIPT_READY"
    :try_end_6b
    .catchall {:try_start_47 .. :try_end_6b} :catchall_75

    monitor-exit p0

    return-object p1

    .line 59
    :cond_6d
    :goto_6d
    :try_start_6d
    const-string p1, "SESSION_CHANGED_AFTER_STAGE"
    :try_end_6f
    .catchall {:try_start_6d .. :try_end_6f} :catchall_75

    monitor-exit p0

    return-object p1

    .line 55
    :cond_71
    :goto_71
    :try_start_71
    const-string p1, "SESSION_STALE"
    :try_end_73
    .catchall {:try_start_71 .. :try_end_73} :catchall_75

    monitor-exit p0

    return-object p1

    .line 48
    :catchall_75
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized receiptStillCurrent()Z
    .registers 2

    monitor-enter p0

    .line 63
    :try_start_1
    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v0, :cond_f

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_12

    if-eqz v0, :cond_f

    const/4 v0, 0x1

    goto :goto_10

    :cond_f
    const/4 v0, 0x0

    :goto_10
    monitor-exit p0

    return v0

    :catchall_12
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized take()Lorg/vtlite/reborn/id64/DialogPageModel$Page;
    .registers 5

    monitor-enter p0

    .line 35
    :try_start_1
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->pending:Lorg/vtlite/reborn/id64/ScopedDialogDelivery;

    .line 36
    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    const/4 v2, 0x0

    .line 37
    iput-object v2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->pending:Lorg/vtlite/reborn/id64/ScopedDialogDelivery;

    iput-object v2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->dispatch:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;
    :try_end_a
    .catchall {:try_start_1 .. :try_end_a} :catchall_3f

    if-nez v0, :cond_e

    .line 38
    monitor-exit p0

    return-object v2

    .line 39
    :cond_e
    :try_start_e
    iget-boolean v3, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v3, :cond_3a

    iget-object v3, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v3}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v3

    if-eqz v3, :cond_3a

    invoke-static {v1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v3

    if-nez v3, :cond_21

    goto :goto_3a

    .line 40
    :cond_21
    invoke-virtual {v0, v1, p0}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->take(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$View;)Lorg/vtlite/reborn/id64/DialogPageModel$Page;

    move-result-object v0

    .line 41
    iget-boolean v3, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v3, :cond_38

    iget-object v3, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v3}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v3

    if-eqz v3, :cond_38

    invoke-static {v1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v1
    :try_end_35
    .catchall {:try_start_e .. :try_end_35} :catchall_3f

    if-eqz v1, :cond_38

    move-object v2, v0

    :cond_38
    monitor-exit p0

    return-object v2

    .line 39
    :cond_3a
    :goto_3a
    :try_start_3a
    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/ScopedDialogDelivery;->invalidate()V
    :try_end_3d
    .catchall {:try_start_3a .. :try_end_3d} :catchall_3f

    monitor-exit p0

    return-object v2

    :catchall_3f
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized takeReceipt()Z
    .registers 5

    monitor-enter p0

    .line 56
    :try_start_1
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->receiptSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    .line 57
    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->receipt:Z

    const/4 v2, 0x0

    .line 58
    iput-boolean v2, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->receipt:Z

    const/4 v3, 0x0

    .line 59
    iput-object v3, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->receiptSession:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    if-eqz v1, :cond_28

    .line 60
    iget-boolean v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->current:Z

    if-eqz v1, :cond_28

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0

    if-eqz v0, :cond_28

    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->origin:Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;

    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->live(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z

    move-result v0
    :try_end_25
    .catchall {:try_start_1 .. :try_end_25} :catchall_2a

    if-eqz v0, :cond_28

    const/4 v2, 0x1

    :cond_28
    monitor-exit p0

    return v2

    :catchall_2a
    move-exception v0

    monitor-exit p0

    throw v0
.end method
