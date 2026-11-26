.class public final Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;
.super Ljava/lang/Object;
.source "RebornCaptchaAccountHooks.java"


# static fields
.field private static final EPOCH:Lorg/vtlite/reborn/captcha/RebornSessionEpoch;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 17
    new-instance v0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;

    new-instance v1, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;

    invoke-direct {v1}, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;-><init>()V

    invoke-direct {v0, v1}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;-><init>(Lorg/vtlite/reborn/captcha/RebornSessionEpoch$AccountReader;)V

    sput-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->EPOCH:Lorg/vtlite/reborn/captcha/RebornSessionEpoch;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static afterMutation()V
    .registers 1

    .line 35
    :try_start_0
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->EPOCH:Lorg/vtlite/reborn/captcha/RebornSessionEpoch;

    invoke-virtual {v0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->attachAfterAccountReady()Z

    move-result v0

    if-nez v0, :cond_15

    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->safeInvalidate()V
    :try_end_b
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_b} :catch_11
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_b} :catch_c

    goto :goto_15

    .line 38
    :catch_c
    move-exception v0

    .line 39
    .local v0, "missingDependency":Ljava/lang/LinkageError;
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->safeInvalidate()V

    goto :goto_16

    .line 36
    .end local v0    # "missingDependency":Ljava/lang/LinkageError;
    :catch_11
    move-exception v0

    .line 37
    .local v0, "unexpected":Ljava/lang/RuntimeException;
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->safeInvalidate()V

    .line 40
    .end local v0    # "unexpected":Ljava/lang/RuntimeException;
    :cond_15
    :goto_15
    nop

    .line 41
    :goto_16
    return-void
.end method

.method public static beforeMutation()V
    .registers 1

    .line 24
    :try_start_0
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->EPOCH:Lorg/vtlite/reborn/captcha/RebornSessionEpoch;

    invoke-virtual {v0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->onAccountBoundary()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_5} :catch_b
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_f

    .line 27
    :catch_6
    move-exception v0

    .line 28
    .local v0, "missingDependency":Ljava/lang/LinkageError;
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->safeInvalidate()V

    goto :goto_10

    .line 25
    .end local v0    # "missingDependency":Ljava/lang/LinkageError;
    :catch_b
    move-exception v0

    .line 26
    .local v0, "unexpected":Ljava/lang/RuntimeException;
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->safeInvalidate()V

    .line 29
    .end local v0    # "unexpected":Ljava/lang/RuntimeException;
    :goto_f
    nop

    .line 30
    :goto_10
    return-void
.end method

.method public static onHostAppReady()V
    .registers 0

    .line 48
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->afterMutation()V

    .line 49
    return-void
.end method

.method public static rebornQaGenerationFor(Ljava/lang/Object;)J
    .registers 4

    :try_start_0
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->EPOCH:Lorg/vtlite/reborn/captcha/RebornSessionEpoch;

    invoke-virtual {v0, p0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->rebornQaReadGenerationFor(Ljava/lang/Object;)J

    move-result-wide v0

    return-wide v0
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_7} :catch_7
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_7} :catch_7

    :catch_7
    move-exception v0

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private static safeInvalidate()V
    .registers 1

    .line 52
    :try_start_0
    sget-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->EPOCH:Lorg/vtlite/reborn/captcha/RebornSessionEpoch;

    invoke-virtual {v0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->onAccountBoundary()V
    :try_end_5
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_5} :catch_8
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_5} :catch_6

    goto :goto_9

    .line 54
    :catch_6
    move-exception v0

    goto :goto_9

    .line 53
    :catch_8
    move-exception v0

    .line 54
    :goto_9
    nop

    .line 55
    :try_start_a
    invoke-static {}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->invalidate()V
    :try_end_d
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_d} :catch_10
    .catch Ljava/lang/LinkageError; {:try_start_a .. :try_end_d} :catch_e

    .line 57
    :goto_d
    goto :goto_12

    :catch_e
    move-exception v0

    goto :goto_d

    .line 56
    :catch_10
    move-exception v0

    goto :goto_d

    .line 58
    :goto_12
    return-void
.end method
