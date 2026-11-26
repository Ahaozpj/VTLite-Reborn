.class Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter$1;
.super Ljava/lang/Object;
.source "CaptchaWorkerAwaiter.java"

# interfaces
.implements Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;->awaitOnWorker(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;

.field final synthetic val$complete:Ljava/util/concurrent/CountDownLatch;

.field final synthetic val$result:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;Ljava/util/concurrent/atomic/AtomicReference;Ljava/util/concurrent/CountDownLatch;)V
    .registers 4
    .param p1, "this$0"    # Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 33
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter$1;->this$0:Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter$1;->val$result:Ljava/util/concurrent/atomic/AtomicReference;

    iput-object p3, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter$1;->val$complete:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancelledOrUnavailable()V
    .registers 2

    .line 39
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter$1;->val$complete:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 40
    return-void
.end method

.method public onSolved(Ljava/lang/String;)V
    .registers 3
    .param p1, "token"    # Ljava/lang/String;

    .line 35
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter$1;->val$result:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 36
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter$1;->val$complete:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 37
    return-void
.end method
