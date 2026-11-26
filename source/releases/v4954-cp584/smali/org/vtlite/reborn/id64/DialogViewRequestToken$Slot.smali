.class public final Lorg/vtlite/reborn/id64/DialogViewRequestToken$Slot;
.super Ljava/lang/Object;
.source "DialogViewRequestToken.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/DialogViewRequestToken;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Slot"
.end annotation


# instance fields
.field private active:Lorg/vtlite/reborn/id64/DialogViewRequestToken;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public declared-synchronized begin()Lorg/vtlite/reborn/id64/DialogViewRequestToken;
    .registers 3

    monitor-enter p0

    .line 73
    :try_start_1
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken$Slot;->invalidate()V

    .line 74
    new-instance v0, Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;-><init>(Lorg/vtlite/reborn/id64/DialogViewRequestToken$1;)V

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken$Slot;->active:Lorg/vtlite/reborn/id64/DialogViewRequestToken;
    :try_end_c
    .catchall {:try_start_1 .. :try_end_c} :catchall_e

    .line 75
    monitor-exit p0

    return-object v0

    :catchall_e
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized invalidate()V
    .registers 2

    monitor-enter p0

    .line 78
    :try_start_1
    iget-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken$Slot;->active:Lorg/vtlite/reborn/id64/DialogViewRequestToken;

    if-eqz v0, :cond_8

    # invokes: Lorg/vtlite/reborn/id64/DialogViewRequestToken;->revoke()V
    invoke-static {v0}, Lorg/vtlite/reborn/id64/DialogViewRequestToken;->access$100(Lorg/vtlite/reborn/id64/DialogViewRequestToken;)V

    :cond_8
    const/4 v0, 0x0

    .line 79
    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogViewRequestToken$Slot;->active:Lorg/vtlite/reborn/id64/DialogViewRequestToken;
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_d

    .line 80
    monitor-exit p0

    return-void

    :catchall_d
    move-exception v0

    monitor-exit p0

    throw v0
.end method
