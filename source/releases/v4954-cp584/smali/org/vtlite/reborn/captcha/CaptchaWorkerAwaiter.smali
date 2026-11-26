.class public final Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;
.super Ljava/lang/Object;
.source "CaptchaWorkerAwaiter.java"


# instance fields
.field private final bridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

.field private final waitMillis:J


# direct methods
.method public constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;J)V
    .registers 6
    .param p1, "bridge"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
    .param p2, "waitMillis"    # J

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    if-eqz p1, :cond_17

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_17

    const-wide/32 v0, 0x493e0

    cmp-long v0, p2, v0

    if-gtz v0, :cond_17

    .line 21
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;->bridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    .line 22
    iput-wide p2, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;->waitMillis:J

    .line 23
    return-void

    .line 19
    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Bridge and 1..300000ms timeout required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public awaitOnWorker(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 11
    .param p1, "accountKey"    # Ljava/lang/String;
    .param p2, "requestNonce"    # Ljava/lang/String;
    .param p3, "trustedRedirectUri"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 28
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_c

    return-object v2

    .line 29
    :cond_c
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_54

    .line 30
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 31
    .local v0, "complete":Ljava/util/concurrent/CountDownLatch;
    new-instance v1, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 32
    .local v1, "result":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/String;>;"
    iget-object v3, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;->bridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    new-instance v4, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter$1;

    invoke-direct {v4, p0, v1, v0}, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter$1;-><init>(Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v3, p1, p2, p3, v4}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->begin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;)Z

    move-result v3

    .line 42
    .local v3, "started":Z
    if-nez v3, :cond_2f

    return-object v2

    .line 44
    :cond_2f
    :try_start_2f
    iget-wide v4, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;->waitMillis:J

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v4, v5, v6}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z

    move-result v4

    if-nez v4, :cond_3f

    .line 45
    iget-object v4, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;->bridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    invoke-virtual {v4}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->cancel()V

    .line 46
    return-object v2

    .line 48
    :cond_3f
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_45
    .catch Ljava/lang/InterruptedException; {:try_start_2f .. :try_end_45} :catch_46

    return-object v2

    .line 49
    :catch_46
    move-exception v2

    .line 50
    .local v2, "interrupted":Ljava/lang/InterruptedException;
    iget-object v4, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;->bridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    invoke-virtual {v4}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->cancel()V

    .line 51
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->interrupt()V

    .line 52
    throw v2

    .line 29
    .end local v0    # "complete":Ljava/util/concurrent/CountDownLatch;
    .end local v1    # "result":Ljava/util/concurrent/atomic/AtomicReference;, "Ljava/util/concurrent/atomic/AtomicReference<Ljava/lang/String;>;"
    .end local v2    # "interrupted":Ljava/lang/InterruptedException;
    .end local v3    # "started":Z
    :cond_54
    new-instance v0, Ljava/lang/InterruptedException;

    const-string v1, "Already interrupted"

    invoke-direct {v0, v1}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
