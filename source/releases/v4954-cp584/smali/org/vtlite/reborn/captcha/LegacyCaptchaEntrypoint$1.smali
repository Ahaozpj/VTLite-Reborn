.class Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$1;
.super Ljava/lang/Object;
.source "LegacyCaptchaEntrypoint.java"

# interfaces
.implements Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->solveWith(Landroid/content/Context;Ljava/lang/String;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;J)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$owner:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

.field final synthetic val$scope:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;


# direct methods
.method constructor <init>(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 80
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$1;->val$scope:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;

    iput-object p2, p0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$1;->val$owner:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isCurrent(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 5
    .param p1, "account"    # Ljava/lang/String;
    .param p2, "nonce"    # Ljava/lang/String;

    .line 82
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$1;->val$scope:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;

    iget-object v0, v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->accountEpoch:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object v0, p0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$1;->val$scope:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;

    iget-object v0, v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->requestNonce:Ljava/lang/String;

    .line 83
    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object v0, p0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$1;->val$owner:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$1;->val$scope:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;

    .line 84
    # invokes: Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->isCurrent(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;)Z
    invoke-static {v0, v1}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->access$000(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;)Z

    move-result v0

    if-eqz v0, :cond_20

    const/4 v0, 0x1

    goto :goto_21

    :cond_20
    const/4 v0, 0x0

    .line 82
    :goto_21
    return v0
.end method
