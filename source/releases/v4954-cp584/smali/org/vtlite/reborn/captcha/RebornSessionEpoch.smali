.class public final Lorg/vtlite/reborn/captcha/RebornSessionEpoch;
.super Ljava/lang/Object;
.source "RebornSessionEpoch.java"

# interfaces
.implements Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/captcha/RebornSessionEpoch$AccountReader;
    }
.end annotation


# static fields
.field private static final HEX:[C


# instance fields
.field private armed:Z

.field private generation:J

.field private latestRequestNonce:Ljava/lang/String;

.field private final lock:Ljava/lang/Object;

.field private pinnedAccount:Ljava/lang/Object;

.field private final random:Ljava/security/SecureRandom;

.field private final reader:Lorg/vtlite/reborn/captcha/RebornSessionEpoch$AccountReader;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 22
    const-string v0, "0123456789abcdef"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->HEX:[C

    return-void
.end method

.method public constructor <init>(Lorg/vtlite/reborn/captcha/RebornSessionEpoch$AccountReader;)V
    .registers 4
    .param p1, "reader"    # Lorg/vtlite/reborn/captcha/RebornSessionEpoch$AccountReader;

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->lock:Ljava/lang/Object;

    .line 25
    new-instance v0, Ljava/security/SecureRandom;

    invoke-direct {v0}, Ljava/security/SecureRandom;-><init>()V

    iput-object v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->random:Ljava/security/SecureRandom;

    .line 32
    if-eqz p1, :cond_16

    .line 33
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->reader:Lorg/vtlite/reborn/captcha/RebornSessionEpoch$AccountReader;

    .line 34
    return-void

    .line 32
    :cond_16
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "AccountReader required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private disarmLocked()V
    .registers 2

    .line 106
    const/4 v0, 0x0

    invoke-static {}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->accountBoundary()V

    iput-boolean v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->armed:Z

    .line 107
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->pinnedAccount:Ljava/lang/Object;

    .line 108
    iput-object v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->latestRequestNonce:Ljava/lang/String;

    .line 109
    return-void
.end method

.method private safelyReadAccount()Ljava/lang/Object;
    .registers 3

    .line 112
    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->reader:Lorg/vtlite/reborn/captcha/RebornSessionEpoch$AccountReader;

    invoke-interface {v1}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch$AccountReader;->currentAccount()Ljava/lang/Object;

    move-result-object v0
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_7} :catch_a
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_7} :catch_8

    return-object v0

    .line 114
    :catch_8
    move-exception v1

    .local v1, "e":Ljava/lang/LinkageError;
    return-object v0

    .line 113
    .end local v1    # "e":Ljava/lang/LinkageError;
    :catch_a
    move-exception v1

    .local v1, "e":Ljava/lang/RuntimeException;
    return-object v0
.end method


# virtual methods
.method public attachAfterAccountReady()Z
    .registers 8

    .line 42
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 43
    :try_start_3
    invoke-direct {p0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->safelyReadAccount()Ljava/lang/Object;

    move-result-object v1

    .line 44
    .local v1, "observed":Ljava/lang/Object;
    const/4 v2, 0x0

    if-nez v1, :cond_12

    .line 45
    invoke-direct {p0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->disarmLocked()V

    .line 46
    invoke-static {}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->invalidate()V

    .line 47
    monitor-exit v0

    return v2

    .line 51
    :cond_12
    iget-boolean v3, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->armed:Z

    if-eqz v3, :cond_1c

    iget-object v3, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->pinnedAccount:Ljava/lang/Object;

    if-eq v3, v1, :cond_1c

    monitor-exit v0

    return v2

    .line 52
    :cond_1c
    iget-wide v3, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    const-wide v5, 0x7fffffffffffffffL

    cmp-long v3, v3, v5

    if-nez v3, :cond_2f

    .line 53
    invoke-direct {p0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->disarmLocked()V

    .line 54
    invoke-static {}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->invalidate()V

    .line 55
    monitor-exit v0

    return v2

    .line 57
    :cond_2f
    iget-wide v2, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    const-wide/16 v4, 0x1

    add-long/2addr v2, v4

    invoke-static {}, Lorg/vtlite/reborn/id64/DialogPreviewScope;->accountBoundary()V

    iput-wide v2, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    .line 58
    iput-object v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->pinnedAccount:Ljava/lang/Object;

    .line 59
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->latestRequestNonce:Ljava/lang/String;

    .line 60
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->armed:Z

    .line 61
    invoke-static {p0}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->installSessionProvider(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$SessionProvider;)V

    .line 62
    monitor-exit v0

    return v2

    .line 63
    .end local v1    # "observed":Ljava/lang/Object;
    :catchall_46
    move-exception v1

    monitor-exit v0
    :try_end_48
    .catchall {:try_start_3 .. :try_end_48} :catchall_46

    throw v1
.end method

.method public capture()Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;
    .registers 8

    .line 78
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 79
    :try_start_3
    iget-boolean v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->armed:Z

    if-eqz v1, :cond_66

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->pinnedAccount:Ljava/lang/Object;

    if-eqz v1, :cond_66

    invoke-direct {p0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->safelyReadAccount()Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->pinnedAccount:Ljava/lang/Object;

    if-ne v1, v2, :cond_66

    iget-wide v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    const-wide v3, 0x7fffffffffffffffL

    cmp-long v1, v1, v3

    if-nez v1, :cond_1f

    goto :goto_66

    .line 81
    :cond_1f
    const/16 v1, 0x10

    new-array v1, v1, [B

    .line 82
    .local v1, "nonce":[B
    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->random:Ljava/security/SecureRandom;

    invoke-virtual {v2, v1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 83
    array-length v2, v1

    mul-int/lit8 v2, v2, 0x2

    new-array v2, v2, [C

    .line 84
    .local v2, "chars":[C
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_2e
    array-length v4, v1

    if-ge v3, v4, :cond_50

    .line 85
    mul-int/lit8 v4, v3, 0x2

    sget-object v5, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->HEX:[C

    aget-byte v6, v1, v3

    ushr-int/lit8 v6, v6, 0x4

    and-int/lit8 v6, v6, 0xf

    aget-char v5, v5, v6

    aput-char v5, v2, v4

    .line 86
    mul-int/lit8 v4, v3, 0x2

    add-int/lit8 v4, v4, 0x1

    sget-object v5, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->HEX:[C

    aget-byte v6, v1, v3

    and-int/lit8 v6, v6, 0xf

    aget-char v5, v5, v6

    aput-char v5, v2, v4

    .line 84
    add-int/lit8 v3, v3, 0x1

    goto :goto_2e

    .line 88
    .end local v3    # "i":I
    :cond_50
    new-instance v3, Ljava/lang/String;

    invoke-direct {v3, v2}, Ljava/lang/String;-><init>([C)V

    iput-object v3, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->latestRequestNonce:Ljava/lang/String;

    .line 89
    new-instance v3, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;

    iget-wide v4, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    .line 90
    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->latestRequestNonce:Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v0

    .line 89
    return-object v3

    .line 80
    .end local v1    # "nonce":[B
    .end local v2    # "chars":[C
    :cond_66
    :goto_66
    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    .line 91
    :catchall_69
    move-exception v1

    monitor-exit v0
    :try_end_6b
    .catchall {:try_start_3 .. :try_end_6b} :catchall_69

    throw v1
.end method

.method public isCurrent(Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;)Z
    .registers 5
    .param p1, "scope"    # Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;

    .line 96
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 97
    if-eqz p1, :cond_35

    :try_start_5
    iget-boolean v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->armed:Z

    if-eqz v1, :cond_35

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->pinnedAccount:Ljava/lang/Object;

    if-eqz v1, :cond_35

    iget-wide v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    .line 98
    invoke-static {v1, v2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->accountEpoch:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->latestRequestNonce:Ljava/lang/String;

    if-eqz v1, :cond_35

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->latestRequestNonce:Ljava/lang/String;

    iget-object v2, p1, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint$Scope;->requestNonce:Ljava/lang/String;

    .line 100
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_35

    .line 101
    invoke-direct {p0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->safelyReadAccount()Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->pinnedAccount:Ljava/lang/Object;

    if-ne v1, v2, :cond_35

    const/4 v1, 0x1

    goto :goto_36

    .line 102
    :catchall_33
    move-exception v1

    goto :goto_38

    .line 101
    :cond_35
    const/4 v1, 0x0

    :goto_36
    monitor-exit v0

    .line 97
    return v1

    .line 102
    :goto_38
    monitor-exit v0
    :try_end_39
    .catchall {:try_start_5 .. :try_end_39} :catchall_33

    throw v1
.end method

.method public onAccountBoundary()V
    .registers 6

    .line 68
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 69
    :try_start_3
    invoke-direct {p0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->disarmLocked()V

    .line 70
    iget-wide v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    const-wide v3, 0x7fffffffffffffffL

    cmp-long v1, v1, v3

    if-gez v1, :cond_18

    iget-wide v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    .line 72
    :cond_18
    invoke-static {}, Lorg/vtlite/reborn/captcha/LegacyCaptchaEntrypoint;->invalidate()V

    .line 73
    monitor-exit v0

    .line 74
    return-void

    .line 73
    :catchall_1d
    move-exception v1

    monitor-exit v0
    :try_end_1f
    .catchall {:try_start_3 .. :try_end_1f} :catchall_1d

    throw v1
.end method

.method public rebornQaReadGenerationFor(Ljava/lang/Object;)J
    .registers 8

    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->lock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    if-eqz p1, :cond_25

    iget-boolean v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->armed:Z

    if-eqz v1, :cond_25

    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->pinnedAccount:Ljava/lang/Object;

    if-ne v1, p1, :cond_25

    invoke-direct {p0}, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->safelyReadAccount()Ljava/lang/Object;

    move-result-object v1

    if-ne v1, p1, :cond_25

    iget-wide v1, p0, Lorg/vtlite/reborn/captcha/RebornSessionEpoch;->generation:J

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-lez v5, :cond_25

    const-wide v3, 0x7fffffffffffffffL

    cmp-long v5, v1, v3

    if-eqz v5, :cond_25

    goto :goto_27

    :cond_25
    const-wide/16 v1, 0x0
    :try_end_27
    .catchall {:try_start_3 .. :try_end_27} :catchall_29

    :goto_27
    monitor-exit v0

    return-wide v1

    :catchall_29
    move-exception v1

    monitor-exit v0

    throw v1
.end method
