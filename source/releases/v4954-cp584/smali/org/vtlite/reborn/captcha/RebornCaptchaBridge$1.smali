.class Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$1;
.super Ljava/lang/Object;
.source "RebornCaptchaBridge.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->begin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

.field final synthetic val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V
    .registers 3
    .param p1, "this$0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 100
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$1;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$1;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 102
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$1;->this$0:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$1;->val$session:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->expire(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V
    invoke-static {v0, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->access$000(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V

    .line 103
    return-void
.end method
