.class public final Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;
.super Ljava/lang/Object;
.source "LegacyCaptchaEntrypoint.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Scope"
.end annotation


# instance fields
.field public final accountEpoch:Ljava/lang/String;

.field public final requestNonce:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3
    .param p1, "accountEpoch"    # Ljava/lang/String;
    .param p2, "requestNonce"    # Ljava/lang/String;

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->accountEpoch:Ljava/lang/String;

    .line 20
    iput-object p2, p0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->requestNonce:Ljava/lang/String;

    .line 21
    return-void
.end method
