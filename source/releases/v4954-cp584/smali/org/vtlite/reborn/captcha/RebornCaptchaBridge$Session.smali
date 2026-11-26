.class final Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
.super Ljava/lang/Object;
.source "RebornCaptchaBridge.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Session"
.end annotation


# instance fields
.field final accountKey:Ljava/lang/String;

.field final completion:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;

.field final domain:Ljava/lang/String;

.field final nonce:Ljava/lang/String;

.field final redirectUri:Ljava/lang/String;

.field timeout:Ljava/lang/Runnable;


# direct methods
.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;)V
    .registers 6
    .param p1, "accountKey"    # Ljava/lang/String;
    .param p2, "nonce"    # Ljava/lang/String;
    .param p3, "domain"    # Ljava/lang/String;
    .param p4, "redirectUri"    # Ljava/lang/String;
    .param p5, "completion"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->accountKey:Ljava/lang/String;

    .line 53
    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->nonce:Ljava/lang/String;

    .line 54
    iput-object p3, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->domain:Ljava/lang/String;

    .line 55
    iput-object p4, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->redirectUri:Ljava/lang/String;

    .line 56
    iput-object p5, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->completion:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;

    .line 57
    return-void
.end method
