.class final Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;
.super Ljava/lang/Object;
.source "RebornCaptchaContextBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Session"
.end annotation


# instance fields
.field final accountKey:Ljava/lang/String;

.field cancelRequested:Z

.field final completion:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;

.field final domain:Ljava/lang/String;

.field final expiry:J

.field final nonce:Ljava/lang/String;

.field opened:Z

.field final redirect:Ljava/lang/String;

.field timeout:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;J)V
    .registers 8
    .param p1, "accountKey"    # Ljava/lang/String;
    .param p2, "nonce"    # Ljava/lang/String;
    .param p3, "domain"    # Ljava/lang/String;
    .param p4, "redirect"    # Ljava/lang/String;
    .param p5, "completion"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;
    .param p6, "expiry"    # J

    .line 180
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 181
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->accountKey:Ljava/lang/String;

    .line 182
    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->nonce:Ljava/lang/String;

    .line 183
    iput-object p3, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->domain:Ljava/lang/String;

    .line 184
    iput-object p4, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->redirect:Ljava/lang/String;

    .line 185
    iput-object p5, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->completion:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Completion;

    .line 186
    iput-wide p6, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$Session;->expiry:J

    .line 187
    return-void
.end method
