.class public final Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;,
        Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;,
        Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;,
        Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;,
        Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;,
        Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;,
        Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;
    }
.end annotation


# static fields
.field private static final DEFAULT_TIMEOUT_MS:J = 0x493e0L

.field private static final MAX_TOKEN_LENGTH:I = 0x2000


# instance fields
.field private final appContext:Landroid/content/Context;

.field private final guard:Ljava/lang/Object;

.field private final main:Landroid/os/Handler;

.field private final ownership:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;

.field private pending:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

.field private final service:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;

.field private final timeoutMs:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;)V
    .registers 9
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ownership"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;

    .line 191
    new-instance v3, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;

    invoke-direct {v3}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;-><init>()V

    const-wide/32 v4, 0x493e0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v5}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;-><init>(Landroid/content/Context;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;J)V

    .line 192
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;J)V
    .registers 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "ownership"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;
    .param p3, "service"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;
    .param p4, "timeoutMs"    # J

    .line 196
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->main:Landroid/os/Handler;

    .line 168
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->guard:Ljava/lang/Object;

    .line 197
    if-eqz p1, :cond_3a

    if-eqz p2, :cond_3a

    if-eqz p3, :cond_3a

    const-wide/16 v0, 0x0

    cmp-long v0, p4, v0

    if-lez v0, :cond_3a

    .line 200
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->appContext:Landroid/content/Context;

    .line 201
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->appContext:Landroid/content/Context;

    if-eqz v0, :cond_32

    .line 202
    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->ownership:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;

    .line 203
    iput-object p3, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->service:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;

    .line 204
    iput-wide p4, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->timeoutMs:J

    .line 205
    return-void

    .line 201
    :cond_32
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Application context unavailable"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 198
    :cond_3a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Context, owner, service and timeout required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$000(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5
    .param p0, "x0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
    .param p1, "x1"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Z

    .line 18
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$100(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V
    .registers 2
    .param p0, "x0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
    .param p1, "x1"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    .line 18
    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->launch(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V

    return-void
.end method

.method static synthetic access$200(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;)Landroid/os/Handler;
    .registers 2
    .param p0, "x0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    .line 18
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->main:Landroid/os/Handler;

    return-object v0
.end method

.method private finish(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 7
    .param p1, "s"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;
    .param p2, "responseDomain"    # Ljava/lang/String;
    .param p3, "token"    # Ljava/lang/String;
    .param p4, "close"    # Z

    .line 263
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->guard:Ljava/lang/Object;

    monitor-enter v0

    .line 264
    :try_start_3
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    if-eq v1, p1, :cond_9

    monitor-exit v0

    return-void

    .line 265
    :cond_9
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    .line 266
    monitor-exit v0
    :try_end_d
    .catchall {:try_start_3 .. :try_end_d} :catchall_60

    .line 267
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->main:Landroid/os/Handler;

    iget-object v1, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 268
    if-nez p4, :cond_40

    iget-boolean v0, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->cancelRequested:Z

    if-nez v0, :cond_40

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->isExpired(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)Z

    move-result v0

    if-nez v0, :cond_40

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->isCurrent(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)Z

    move-result v0

    if-eqz v0, :cond_40

    iget-object v0, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->domain:Ljava/lang/String;

    .line 269
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_40

    if-eqz p3, :cond_40

    .line 270
    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_40

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x2000

    if-gt v0, v1, :cond_40

    const/4 v0, 0x1

    goto :goto_41

    :cond_40
    const/4 v0, 0x0

    .line 271
    .local v0, "accepted":Z
    :goto_41
    if-nez p4, :cond_45

    if-nez v0, :cond_48

    :cond_45
    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->safelyClose(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V

    .line 272
    :cond_48
    if-eqz v0, :cond_55

    .line 273
    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->OWNER_ACCEPTED_TOKEN:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 274
    iget-object v1, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->completion:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;

    invoke-interface {v1, p3}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;->onSolved(Ljava/lang/String;)V

    goto :goto_5f

    .line 276
    :cond_55
    sget-object v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->TOKEN_NOT_ACCEPTED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 277
    iget-object v1, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->completion:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;

    invoke-interface {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;->onCancelledOrUnavailable()V

    .line 279
    :goto_5f
    return-void

    .line 266
    .end local v0    # "accepted":Z
    :catchall_60
    move-exception v1

    :try_start_61
    monitor-exit v0
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_60

    throw v1
.end method

.method private isCurrent(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)Z
    .registers 5
    .param p1, "s"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    .line 303
    :try_start_0
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->ownership:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;

    iget-object v1, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->accountKey:Ljava/lang/String;

    iget-object v2, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->nonce:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;->isCurrent(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_a} :catch_b

    return v0

    .line 304
    :catch_b
    move-exception v0

    .local v0, "ignored":Ljava/lang/RuntimeException;
    const/4 v1, 0x0

    return v1
.end method

.method private isExpired(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)Z
    .registers 6
    .param p1, "s"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    .line 301
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->expiry:J

    cmp-long v0, v0, v2

    if-ltz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method private isPending(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)Z
    .registers 4
    .param p1, "s"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    .line 300
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->guard:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    if-ne v1, p1, :cond_9

    const/4 v1, 0x1

    goto :goto_a

    :cond_9
    const/4 v1, 0x0

    :goto_a
    monitor-exit v0

    return v1

    :catchall_c
    move-exception v1

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw v1
.end method

.method private launch(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V
    .registers 9
    .param p1, "s"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    .line 234
    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->isPending(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)Z

    move-result v0

    if-nez v0, :cond_7

    return-void

    .line 235
    :cond_7
    iget-boolean v0, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->cancelRequested:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_11

    invoke-direct {p0, p1, v2, v2, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void

    .line 236
    :cond_11
    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->isCurrent(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)Z

    move-result v0

    if-eqz v0, :cond_4b

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->isExpired(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)Z

    move-result v0

    if-eqz v0, :cond_1e

    goto :goto_4b

    .line 238
    :cond_1e
    :try_start_1e
    iput-boolean v1, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->opened:Z

    .line 239
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_UI_LAUNCH_ATTEMPT:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 240
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->service:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;

    iget-object v3, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->appContext:Landroid/content/Context;

    iget-object v4, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->domain:Ljava/lang/String;

    iget-object v5, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->redirect:Ljava/lang/String;

    new-instance v6, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;

    invoke-direct {v6, p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$3;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V

    invoke-interface {v0, v3, v4, v5, v6}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;->open(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeListener;)V
    :try_end_35
    .catch Ljava/lang/RuntimeException; {:try_start_1e .. :try_end_35} :catch_40
    .catch Ljava/lang/LinkageError; {:try_start_1e .. :try_end_35} :catch_36

    goto :goto_49

    .line 255
    :catch_36
    move-exception v0

    .line 256
    .local v0, "ignored":Ljava/lang/LinkageError;
    sget-object v3, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_LAUNCH_EXCEPTION:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v3}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 257
    invoke-direct {p0, p1, v2, v2, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_4a

    .line 252
    .end local v0    # "ignored":Ljava/lang/LinkageError;
    :catch_40
    move-exception v0

    .line 253
    .local v0, "ignored":Ljava/lang/RuntimeException;
    sget-object v3, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->SDK_LAUNCH_EXCEPTION:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v3}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 254
    invoke-direct {p0, p1, v2, v2, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 258
    .end local v0    # "ignored":Ljava/lang/RuntimeException;
    :goto_49
    nop

    .line 259
    :goto_4a
    return-void

    .line 236
    :cond_4b
    :goto_4b
    invoke-direct {p0, p1, v2, v2, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void
.end method

.method private safelyClose(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V
    .registers 3
    .param p1, "s"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    .line 296
    iget-boolean v0, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->opened:Z

    if-nez v0, :cond_5

    return-void

    .line 297
    :cond_5
    :try_start_5
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->service:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;

    invoke-interface {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;->close()V
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_a} :catch_d
    .catch Ljava/lang/LinkageError; {:try_start_5 .. :try_end_a} :catch_b

    goto :goto_e

    .line 298
    :catch_b
    move-exception v0

    goto :goto_e

    .line 297
    :catch_d
    move-exception v0

    .line 298
    :goto_e
    nop

    .line 299
    return-void
.end method


# virtual methods
.method public begin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;)Z
    .registers 19
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "nonce"    # Ljava/lang/String;
    .param p3, "redirectUri"    # Ljava/lang/String;
    .param p4, "completion"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;

    .line 209
    move-object v1, p0

    invoke-static/range {p3 .. p3}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->trustedVkDomain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 210
    .local v10, "domain":Ljava/lang/String;
    const/4 v0, 0x0

    if-eqz v10, :cond_7e

    if-eqz p1, :cond_7e

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_7e

    if-eqz p2, :cond_7e

    .line 211
    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v2

    if-eqz v2, :cond_7e

    if-nez p4, :cond_1b

    goto :goto_7e

    .line 212
    :cond_1b
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v11

    .line 213
    .local v11, "now":J
    new-instance v13, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    iget-wide v2, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->timeoutMs:J

    add-long v8, v11, v2

    move-object v2, v13

    move-object v3, p1

    move-object/from16 v4, p2

    move-object v5, v10

    move-object/from16 v6, p3

    move-object/from16 v7, p4

    invoke-direct/range {v2 .. v9}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;J)V

    .line 214
    .local v2, "s":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;
    iget-object v3, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->guard:Ljava/lang/Object;

    monitor-enter v3

    .line 215
    :try_start_34
    iget-object v4, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    if-eqz v4, :cond_3a

    monitor-exit v3

    return v0

    .line 216
    :cond_3a
    iput-object v2, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    .line 217
    monitor-exit v3
    :try_end_3d
    .catchall {:try_start_34 .. :try_end_3d} :catchall_7b

    .line 218
    sget-object v3, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->CHALLENGE_ADMITTED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v3}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 219
    new-instance v3, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$1;

    invoke-direct {v3, p0, v2}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$1;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V

    iput-object v3, v2, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->timeout:Ljava/lang/Runnable;

    .line 222
    iget-object v3, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->main:Landroid/os/Handler;

    iget-object v4, v2, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->timeout:Ljava/lang/Runnable;

    iget-wide v5, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->timeoutMs:J

    invoke-virtual {v3, v4, v5, v6}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v3

    if-eqz v3, :cond_65

    iget-object v3, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->main:Landroid/os/Handler;

    new-instance v4, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$2;

    invoke-direct {v4, p0, v2}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$2;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    move-result v3

    if-nez v3, :cond_63

    goto :goto_65

    .line 230
    :cond_63
    const/4 v0, 0x1

    return v0

    .line 226
    :cond_65
    :goto_65
    iget-object v3, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->main:Landroid/os/Handler;

    iget-object v4, v2, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 227
    iget-object v4, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->guard:Ljava/lang/Object;

    monitor-enter v4

    :try_start_6f
    iget-object v3, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    if-ne v3, v2, :cond_76

    const/4 v3, 0x0

    iput-object v3, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    :cond_76
    monitor-exit v4

    .line 228
    return v0

    .line 227
    :catchall_78
    move-exception v0

    monitor-exit v4
    :try_end_7a
    .catchall {:try_start_6f .. :try_end_7a} :catchall_78

    throw v0

    .line 217
    :catchall_7b
    move-exception v0

    :try_start_7c
    monitor-exit v3
    :try_end_7d
    .catchall {:try_start_7c .. :try_end_7d} :catchall_7b

    throw v0

    .line 211
    .end local v2    # "s":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;
    .end local v11    # "now":J
    :cond_7e
    :goto_7e
    return v0
.end method

.method public cancel()V
    .registers 4

    .line 283
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->guard:Ljava/lang/Object;

    monitor-enter v0

    .line 284
    :try_start_3
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;

    .line 285
    .local v1, "cancelled":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;
    if-eqz v1, :cond_20

    iget-boolean v2, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->cancelRequested:Z

    if-eqz v2, :cond_c

    goto :goto_20

    .line 287
    :cond_c
    const/4 v2, 0x1

    iput-boolean v2, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->cancelRequested:Z

    .line 288
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_3 .. :try_end_10} :catchall_22

    .line 289
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;->CHALLENGE_CANCELLED:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents;->emit(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$QaEvents$Event;)V

    .line 290
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->main:Landroid/os/Handler;

    new-instance v2, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$4;

    invoke-direct {v2, p0, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$4;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;)V

    invoke-virtual {v0, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 293
    return-void

    .line 285
    :cond_20
    :goto_20
    :try_start_20
    monitor-exit v0

    return-void

    .line 288
    .end local v1    # "cancelled":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;
    :catchall_22
    move-exception v1

    monitor-exit v0
    :try_end_24
    .catchall {:try_start_20 .. :try_end_24} :catchall_22

    throw v1
.end method
