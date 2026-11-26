.class public final Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;
.super Ljava/lang/Object;
.source "LegacyCaptchaEntrypoint.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;,
        Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;
    }
.end annotation


# static fields
.field private static final ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static final GUARD:Ljava/lang/Object;

.field private static final MAX_WAIT_MS:J = 0x493e0L

.field private static volatile activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

.field private static volatile provider:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 31
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 32
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->GUARD:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;)Z
    .registers 3
    .param p0, "x0"    # Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;
    .param p1, "x1"    # Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;

    .line 15
    invoke-static {p0, p1}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->isCurrent(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;)Z

    move-result v0

    return v0
.end method

.method public static installSessionProvider(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;)V
    .registers 3
    .param p0, "newProvider"    # Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

    .line 41
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->GUARD:Ljava/lang/Object;

    monitor-enter v0

    .line 42
    :try_start_3
    sput-object p0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->provider:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

    .line 43
    sget-object v1, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    if-eqz v1, :cond_e

    sget-object v1, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    invoke-virtual {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->cancel()V

    .line 44
    :cond_e
    monitor-exit v0

    .line 45
    return-void

    .line 44
    :catchall_10
    move-exception v1

    monitor-exit v0
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_10

    throw v1
.end method

.method public static invalidate()V
    .registers 1

    .line 48
    const/4 v0, 0x0

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->installSessionProvider(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;)V

    return-void
.end method

.method private static isCurrent(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;)Z
    .registers 4
    .param p0, "provider"    # Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;
    .param p1, "scope"    # Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;

    .line 115
    :try_start_0
    invoke-interface {p0, p1}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;->isCurrent(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;)Z

    move-result v0
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_4} :catch_5

    return v0

    .line 116
    :catch_5
    move-exception v0

    .local v0, "ex":Ljava/lang/RuntimeException;
    const/4 v1, 0x0

    return v1
.end method

.method static solveWith(Landroid/content/Context;Ljava/lang/String;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;J)Ljava/lang/String;
    .registers 21
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "redirectUri"    # Ljava/lang/String;
    .param p2, "owner"    # Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;
    .param p3, "sdk"    # Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;
    .param p4, "timeoutMs"    # J

    .line 64
    move-object/from16 v1, p2

    move-wide/from16 v8, p4

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    const/4 v10, 0x0

    if-ne v0, v2, :cond_10

    return-object v10

    .line 65
    :cond_10
    if-eqz p0, :cond_176

    if-eqz v1, :cond_176

    if-eqz p3, :cond_176

    const-wide/16 v2, 0x1

    cmp-long v0, v8, v2

    if-ltz v0, :cond_176

    const-wide/32 v2, 0x493e0

    cmp-long v0, v8, v2

    if-gtz v0, :cond_176

    .line 67
    invoke-static/range {p1 .. p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->trustedVkDomain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_2d

    move-object/from16 v4, p1

    goto/16 :goto_178

    .line 69
    :cond_2d
    :try_start_2d
    invoke-interface/range {p2 .. p2}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;->capture()Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;

    move-result-object v0
    :try_end_31
    .catch Ljava/lang/RuntimeException; {:try_start_2d .. :try_end_31} :catch_170

    move-object v11, v0

    .line 70
    .local v11, "scope":Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;
    nop

    .line 71
    if-eqz v11, :cond_16d

    iget-object v0, v11, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->accountEpoch:Ljava/lang/String;

    if-eqz v0, :cond_16d

    iget-object v0, v11, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->accountEpoch:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_16d

    iget-object v0, v11, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->requestNonce:Ljava/lang/String;

    if-eqz v0, :cond_16d

    iget-object v0, v11, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->requestNonce:Ljava/lang/String;

    .line 72
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_51

    move-object/from16 v4, p1

    goto/16 :goto_16f

    .line 73
    :cond_51
    invoke-static {v1, v11}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->isCurrent(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;)Z

    move-result v0

    if-nez v0, :cond_58

    return-object v10

    .line 74
    :cond_58
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->provider:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

    const/4 v2, 0x1

    const/4 v12, 0x0

    if-ne v0, v1, :cond_60

    move v0, v2

    goto :goto_61

    :cond_60
    move v0, v12

    :goto_61
    move v13, v0

    .line 75
    .local v13, "startedUnderRegisteredOwner":Z
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v12, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_6b

    return-object v10

    .line 76
    :cond_6b
    const/4 v14, 0x0

    .line 79
    .local v14, "bridge":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
    :try_start_6c
    new-instance v0, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    new-instance v4, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$1;

    invoke-direct {v4, v11, v1}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$1;-><init>(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;)V

    move-object v2, v0

    move-object v3, p0

    move-object/from16 v5, p3

    move-wide/from16 v6, p4

    invoke-direct/range {v2 .. v7}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;-><init>(Landroid/content/Context;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$CurrentRequest;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;J)V

    move-object v14, v0

    .line 87
    sget-object v2, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->GUARD:Ljava/lang/Object;

    monitor-enter v2
    :try_end_80
    .catch Ljava/lang/InterruptedException; {:try_start_6c .. :try_end_80} :catch_12e
    .catch Ljava/lang/RuntimeException; {:try_start_6c .. :try_end_80} :catch_110
    .catch Ljava/lang/LinkageError; {:try_start_6c .. :try_end_80} :catch_f2
    .catchall {:try_start_6c .. :try_end_80} :catchall_ee

    .line 89
    :try_start_80
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->provider:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

    if-eq v1, v0, :cond_88

    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->provider:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

    if-nez v0, :cond_8a

    :cond_88
    sput-object v14, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    .line 90
    :cond_8a
    monitor-exit v2
    :try_end_8b
    .catchall {:try_start_80 .. :try_end_8b} :catchall_e1

    .line 91
    :try_start_8b
    new-instance v0, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;

    invoke-direct {v0, v14, v8, v9}, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;J)V

    move-object v2, v0

    .line 92
    .local v2, "awaiter":Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;
    iget-object v0, v11, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->accountEpoch:Ljava/lang/String;

    iget-object v3, v11, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->requestNonce:Ljava/lang/String;
    :try_end_95
    .catch Ljava/lang/InterruptedException; {:try_start_8b .. :try_end_95} :catch_12e
    .catch Ljava/lang/RuntimeException; {:try_start_8b .. :try_end_95} :catch_110
    .catch Ljava/lang/LinkageError; {:try_start_8b .. :try_end_95} :catch_f2
    .catchall {:try_start_8b .. :try_end_95} :catchall_ee

    move-object/from16 v4, p1

    :try_start_97
    invoke-virtual {v2, v0, v3, v4}, Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;->awaitOnWorker(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move-object v3, v0

    .line 93
    .local v3, "token":Ljava/lang/String;
    if-eqz v3, :cond_c9

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_c9

    invoke-static {v1, v11}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->isCurrent(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;)Z

    move-result v0

    if-eqz v0, :cond_c9

    if-eqz v13, :cond_b1

    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->provider:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;
    :try_end_ae
    .catch Ljava/lang/InterruptedException; {:try_start_97 .. :try_end_ae} :catch_ea
    .catch Ljava/lang/RuntimeException; {:try_start_97 .. :try_end_ae} :catch_e8
    .catch Ljava/lang/LinkageError; {:try_start_97 .. :try_end_ae} :catch_e6
    .catchall {:try_start_97 .. :try_end_ae} :catchall_153

    if-eq v0, v1, :cond_b1

    goto :goto_c9

    .line 95
    :cond_b1
    nop

    .line 104
    nop

    .line 105
    invoke-virtual {v14}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->cancel()V

    .line 106
    sget-object v5, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->GUARD:Ljava/lang/Object;

    monitor-enter v5

    .line 107
    :try_start_b9
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    if-ne v0, v14, :cond_bf

    sput-object v10, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    .line 108
    :cond_bf
    monitor-exit v5
    :try_end_c0
    .catchall {:try_start_b9 .. :try_end_c0} :catchall_c6

    .line 110
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 95
    return-object v3

    .line 108
    :catchall_c6
    move-exception v0

    :try_start_c7
    monitor-exit v5
    :try_end_c8
    .catchall {:try_start_c7 .. :try_end_c8} :catchall_c6

    throw v0

    .line 94
    :cond_c9
    :goto_c9
    nop

    .line 104
    nop

    .line 105
    invoke-virtual {v14}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->cancel()V

    .line 106
    sget-object v5, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->GUARD:Ljava/lang/Object;

    monitor-enter v5

    .line 107
    :try_start_d1
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    if-ne v0, v14, :cond_d7

    sput-object v10, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    .line 108
    :cond_d7
    monitor-exit v5
    :try_end_d8
    .catchall {:try_start_d1 .. :try_end_d8} :catchall_de

    .line 110
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 94
    return-object v10

    .line 108
    :catchall_de
    move-exception v0

    :try_start_df
    monitor-exit v5
    :try_end_e0
    .catchall {:try_start_df .. :try_end_e0} :catchall_de

    throw v0

    .line 90
    .end local v2    # "awaiter":Lorg/vtlite/reborn/captcha/CaptchaWorkerAwaiter;
    .end local v3    # "token":Ljava/lang/String;
    :catchall_e1
    move-exception v0

    move-object/from16 v4, p1

    :goto_e4
    :try_start_e4
    monitor-exit v2
    :try_end_e5
    .catchall {:try_start_e4 .. :try_end_e5} :catchall_ec

    .end local v11    # "scope":Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;
    .end local v13    # "startedUnderRegisteredOwner":Z
    .end local v14    # "bridge":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
    .end local p0    # "context":Landroid/content/Context;
    .end local p1    # "redirectUri":Ljava/lang/String;
    .end local p2    # "owner":Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;
    .end local p3    # "sdk":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;
    .end local p4    # "timeoutMs":J
    :try_start_e5
    throw v0
    :try_end_e6
    .catch Ljava/lang/InterruptedException; {:try_start_e5 .. :try_end_e6} :catch_ea
    .catch Ljava/lang/RuntimeException; {:try_start_e5 .. :try_end_e6} :catch_e8
    .catch Ljava/lang/LinkageError; {:try_start_e5 .. :try_end_e6} :catch_e6
    .catchall {:try_start_e5 .. :try_end_e6} :catchall_153

    .line 101
    .restart local v11    # "scope":Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;
    .restart local v13    # "startedUnderRegisteredOwner":Z
    .restart local v14    # "bridge":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
    .restart local p0    # "context":Landroid/content/Context;
    .restart local p1    # "redirectUri":Ljava/lang/String;
    .restart local p2    # "owner":Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;
    .restart local p3    # "sdk":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;
    .restart local p4    # "timeoutMs":J
    :catch_e6
    move-exception v0

    goto :goto_f5

    .line 99
    :catch_e8
    move-exception v0

    goto :goto_113

    .line 96
    :catch_ea
    move-exception v0

    goto :goto_131

    .line 90
    :catchall_ec
    move-exception v0

    goto :goto_e4

    .line 104
    :catchall_ee
    move-exception v0

    move-object/from16 v4, p1

    goto :goto_154

    .line 101
    :catch_f2
    move-exception v0

    move-object/from16 v4, p1

    :goto_f5
    move-object v2, v0

    .line 102
    .local v2, "missingSdk":Ljava/lang/LinkageError;
    nop

    .line 104
    if-eqz v14, :cond_10a

    .line 105
    invoke-virtual {v14}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->cancel()V

    .line 106
    sget-object v3, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->GUARD:Ljava/lang/Object;

    monitor-enter v3

    .line 107
    :try_start_ff
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    if-ne v0, v14, :cond_105

    sput-object v10, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    .line 108
    :cond_105
    monitor-exit v3

    goto :goto_10a

    :catchall_107
    move-exception v0

    monitor-exit v3
    :try_end_109
    .catchall {:try_start_ff .. :try_end_109} :catchall_107

    throw v0

    .line 110
    :cond_10a
    :goto_10a
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 102
    return-object v10

    .line 99
    .end local v2    # "missingSdk":Ljava/lang/LinkageError;
    :catch_110
    move-exception v0

    move-object/from16 v4, p1

    :goto_113
    move-object v2, v0

    .line 100
    .local v2, "failure":Ljava/lang/RuntimeException;
    nop

    .line 104
    if-eqz v14, :cond_128

    .line 105
    invoke-virtual {v14}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->cancel()V

    .line 106
    sget-object v3, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->GUARD:Ljava/lang/Object;

    monitor-enter v3

    .line 107
    :try_start_11d
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    if-ne v0, v14, :cond_123

    sput-object v10, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    .line 108
    :cond_123
    monitor-exit v3

    goto :goto_128

    :catchall_125
    move-exception v0

    monitor-exit v3
    :try_end_127
    .catchall {:try_start_11d .. :try_end_127} :catchall_125

    throw v0

    .line 110
    :cond_128
    :goto_128
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 100
    return-object v10

    .line 96
    .end local v2    # "failure":Ljava/lang/RuntimeException;
    :catch_12e
    move-exception v0

    move-object/from16 v4, p1

    :goto_131
    move-object v2, v0

    .line 97
    .local v2, "interrupted":Ljava/lang/InterruptedException;
    :try_start_132
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_139
    .catchall {:try_start_132 .. :try_end_139} :catchall_153

    .line 98
    nop

    .line 104
    if-eqz v14, :cond_14d

    .line 105
    invoke-virtual {v14}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->cancel()V

    .line 106
    sget-object v3, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->GUARD:Ljava/lang/Object;

    monitor-enter v3

    .line 107
    :try_start_142
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    if-ne v0, v14, :cond_148

    sput-object v10, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    .line 108
    :cond_148
    monitor-exit v3

    goto :goto_14d

    :catchall_14a
    move-exception v0

    monitor-exit v3
    :try_end_14c
    .catchall {:try_start_142 .. :try_end_14c} :catchall_14a

    throw v0

    .line 110
    :cond_14d
    :goto_14d
    sget-object v0, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 98
    return-object v10

    .line 104
    .end local v2    # "interrupted":Ljava/lang/InterruptedException;
    :catchall_153
    move-exception v0

    :goto_154
    if-eqz v14, :cond_167

    .line 105
    invoke-virtual {v14}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;->cancel()V

    .line 106
    sget-object v2, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->GUARD:Ljava/lang/Object;

    monitor-enter v2

    .line 107
    :try_start_15c
    sget-object v3, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    if-ne v3, v14, :cond_162

    sput-object v10, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->activeBridge:Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;

    .line 108
    :cond_162
    monitor-exit v2

    goto :goto_167

    :catchall_164
    move-exception v0

    monitor-exit v2
    :try_end_166
    .catchall {:try_start_15c .. :try_end_166} :catchall_164

    throw v0

    .line 110
    :cond_167
    :goto_167
    sget-object v2, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->ACTIVE:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 111
    throw v0

    .line 71
    .end local v13    # "startedUnderRegisteredOwner":Z
    .end local v14    # "bridge":Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge;
    :cond_16d
    move-object/from16 v4, p1

    .line 72
    :goto_16f
    return-object v10

    .line 70
    .end local v11    # "scope":Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;
    :catch_170
    move-exception v0

    move-object/from16 v4, p1

    move-object v2, v0

    move-object v0, v2

    .local v0, "ex":Ljava/lang/RuntimeException;
    return-object v10

    .line 65
    .end local v0    # "ex":Ljava/lang/RuntimeException;
    :cond_176
    move-object/from16 v4, p1

    .line 67
    :goto_178
    return-object v10
.end method

.method public static trySolve(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .registers 10
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "redirectUri"    # Ljava/lang/String;

    .line 52
    sget-object v6, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->provider:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

    .line 53
    .local v6, "p":Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;
    const/4 v7, 0x0

    if-nez v6, :cond_6

    return-object v7

    .line 54
    :cond_6
    new-instance v3, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;

    invoke-direct {v3}, Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$OfficialChallengeService;-><init>()V

    const-wide/32 v4, 0x493e0

    move-object v0, p0

    move-object v1, p1

    move-object v2, v6

    invoke-static/range {v0 .. v5}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->solveWith(Landroid/content/Context;Ljava/lang/String;Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;Lorg/vtlite/reborn/captcha/RebornCaptchaContextBridge$ChallengeService;J)Ljava/lang/String;

    move-result-object v0

    .line 57
    .local v0, "token":Ljava/lang/String;
    sget-object v1, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->provider:Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;

    if-ne v1, v6, :cond_1a

    move-object v7, v0

    :cond_1a
    return-object v7
.end method
