.class public final Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;
.super Ljava/lang/Object;
.source "RebornCaptchaBridge.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;,
        Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$CurrentRequest;,
        Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;
    }
.end annotation


# static fields
.field private static final HOSTS:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAX_CHALLENGE_MS:J = 0x493e0L


# instance fields
.field private final activity:Landroid/app/Activity;

.field private final currentRequest:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$CurrentRequest;

.field private final main:Landroid/os/Handler;

.field private pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 33
    new-instance v0, Ljava/util/HashSet;

    const-string v7, "api.vk.ru"

    const-string v8, "api.vk.com"

    const-string v1, "vk.ru"

    const-string v2, "vk.com"

    const-string v3, "id.vk.ru"

    const-string v4, "id.vk.com"

    const-string v5, "oauth.vk.ru"

    const-string v6, "oauth.vk.com"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->HOSTS:Ljava/util/Set;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$CurrentRequest;)V
    .registers 5
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "currentRequest"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$CurrentRequest;

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->main:Landroid/os/Handler;

    .line 61
    if-eqz p1, :cond_17

    if-eqz p2, :cond_17

    .line 64
    iput-object p1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->activity:Landroid/app/Activity;

    .line 65
    iput-object p2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->currentRequest:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$CurrentRequest;

    .line 66
    return-void

    .line 62
    :cond_17
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Activity and request ownership checker are required"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method static synthetic access$000(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V
    .registers 2
    .param p0, "x0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;
    .param p1, "x1"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    .line 23
    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->expire(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V

    return-void
.end method

.method static synthetic access$100(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;)Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
    .registers 2
    .param p0, "x0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    .line 23
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    return-object v0
.end method

.method static synthetic access$200(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)Z
    .registers 3
    .param p0, "x0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;
    .param p1, "x1"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    .line 23
    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->isCurrentSafe(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V
    .registers 3
    .param p0, "x0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;
    .param p1, "x1"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
    .param p2, "x2"    # Ljava/lang/String;

    .line 23
    invoke-direct {p0, p1, p2}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->finish(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$400(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;)Landroid/app/Activity;
    .registers 2
    .param p0, "x0"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;

    .line 23
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->activity:Landroid/app/Activity;

    return-object v0
.end method

.method private expire(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V
    .registers 4
    .param p1, "session"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    .line 174
    monitor-enter p0

    .line 175
    :try_start_1
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    if-eq v0, p1, :cond_7

    monitor-exit p0

    return-void

    .line 176
    :cond_7
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    .line 177
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_1 .. :try_end_b} :catchall_1f

    .line 178
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->main:Landroid/os/Handler;

    iget-object v1, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 180
    :try_start_12
    sget-object v0, Lcom/vk/id/captcha/api/VKCaptcha;->INSTANCE:Lcom/vk/id/captcha/api/VKCaptcha;

    invoke-virtual {v0}, Lcom/vk/id/captcha/api/VKCaptcha;->closeCaptcha()V
    :try_end_17
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_17} :catch_18

    .line 183
    goto :goto_19

    .line 181
    :catch_18
    move-exception v0

    .line 184
    :goto_19
    iget-object v0, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->completion:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;

    invoke-interface {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;->onCancelledOrUnavailable()V

    .line 185
    return-void

    .line 177
    :catchall_1f
    move-exception v0

    :try_start_20
    monitor-exit p0
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1f

    throw v0
.end method

.method private finish(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;Ljava/lang/String;)V
    .registers 6
    .param p1, "session"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
    .param p2, "maybeToken"    # Ljava/lang/String;

    .line 152
    monitor-enter p0

    .line 153
    :try_start_1
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    if-ne v0, p1, :cond_7

    const/4 v0, 0x1

    goto :goto_8

    :cond_7
    const/4 v0, 0x0

    .line 154
    .local v0, "accepted":Z
    :goto_8
    if-eqz v0, :cond_d

    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    .line 155
    :cond_d
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_1 .. :try_end_e} :catchall_32

    .line 156
    if-nez v0, :cond_11

    return-void

    .line 157
    :cond_11
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->main:Landroid/os/Handler;

    iget-object v2, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 158
    if-eqz p2, :cond_2c

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2c

    invoke-direct {p0, p1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->isCurrentSafe(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)Z

    move-result v1

    if-eqz v1, :cond_2c

    .line 159
    iget-object v1, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->completion:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;

    invoke-interface {v1, p2}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;->onSolved(Ljava/lang/String;)V

    goto :goto_31

    .line 161
    :cond_2c
    iget-object v1, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->completion:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;

    invoke-interface {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;->onCancelledOrUnavailable()V

    .line 163
    :goto_31
    return-void

    .line 155
    .end local v0    # "accepted":Z
    :catchall_32
    move-exception v0

    :try_start_33
    monitor-exit p0
    :try_end_34
    .catchall {:try_start_33 .. :try_end_34} :catchall_32

    throw v0
.end method

.method private isCurrentSafe(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)Z
    .registers 5
    .param p1, "session"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    .line 167
    :try_start_0
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->currentRequest:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$CurrentRequest;

    iget-object v1, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->accountKey:Ljava/lang/String;

    iget-object v2, p1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->nonce:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$CurrentRequest;->isCurrent(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0
    :try_end_a
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_a} :catch_b

    return v0

    .line 168
    :catch_b
    move-exception v0

    .line 169
    .local v0, "ignored":Ljava/lang/RuntimeException;
    const/4 v1, 0x0

    return v1
.end method

.method public static trustedVkDomain(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "redirect"    # Ljava/lang/String;

    .line 70
    const/4 v0, 0x0

    if-eqz p0, :cond_8d

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x9

    if-lt v1, v2, :cond_8d

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x1000

    if-le v1, v2, :cond_15

    goto/16 :goto_8d

    .line 71
    :cond_15
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_16
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2d

    .line 72
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 73
    .local v2, "c":C
    const/16 v3, 0x1f

    if-le v2, v3, :cond_2c

    const/16 v3, 0x7f

    if-ne v2, v3, :cond_29

    goto :goto_2c

    .line 71
    .end local v2    # "c":C
    :cond_29
    add-int/lit8 v1, v1, 0x1

    goto :goto_16

    .line 73
    .restart local v2    # "c":C
    :cond_2c
    :goto_2c
    return-object v0

    .line 76
    .end local v1    # "i":I
    .end local v2    # "c":C
    :cond_2d
    :try_start_2d
    new-instance v1, Ljava/net/URI;

    invoke-direct {v1, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    .line 77
    .local v1, "uri":Ljava/net/URI;
    invoke-virtual {v1}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v2

    .line 78
    .local v2, "scheme":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 79
    .local v3, "host":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/net/URI;->getPort()I

    move-result v4

    .line 80
    .local v4, "port":I
    if-eqz v2, :cond_8a

    const-string v5, "https"

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_8a

    if-eqz v3, :cond_8a

    const/4 v5, -0x1

    if-eq v4, v5, :cond_51

    const/16 v5, 0x1bb

    if-ne v4, v5, :cond_8a

    .line 81
    :cond_51
    invoke-virtual {v1}, Ljava/net/URI;->getRawUserInfo()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_8a

    invoke-virtual {v1}, Ljava/net/URI;->getRawFragment()Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_8a

    const-string v5, "."

    invoke-virtual {v3, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_66

    goto :goto_8a

    .line 84
    :cond_66
    sget-object v5, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v3, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    move-object v3, v5

    .line 85
    sget-object v5, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->HOSTS:Ljava/util/Set;

    invoke-interface {v5, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_76

    return-object v0

    .line 86
    :cond_76
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "https://"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_89
    .catch Ljava/net/URISyntaxException; {:try_start_2d .. :try_end_89} :catch_8b
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2d .. :try_end_89} :catch_8b

    return-object v0

    .line 82
    :cond_8a
    :goto_8a
    return-object v0

    .line 87
    .end local v1    # "uri":Ljava/net/URI;
    .end local v2    # "scheme":Ljava/lang/String;
    .end local v3    # "host":Ljava/lang/String;
    .end local v4    # "port":I
    :catch_8b
    move-exception v1

    .line 88
    .local v1, "ignored":Ljava/lang/Exception;
    return-object v0

    .line 70
    .end local v1    # "ignored":Ljava/lang/Exception;
    :cond_8d
    :goto_8d
    return-object v0
.end method


# virtual methods
.method public declared-synchronized begin(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;)Z
    .registers 14
    .param p1, "accountKey"    # Ljava/lang/String;
    .param p2, "requestNonce"    # Ljava/lang/String;
    .param p3, "redirect"    # Ljava/lang/String;
    .param p4, "done"    # Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;

    monitor-enter p0

    .line 94
    :try_start_1
    invoke-static {p3}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->trustedVkDomain(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 95
    .local v0, "domain":Ljava/lang/String;
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    const/4 v7, 0x0

    if-nez v1, :cond_53

    if-eqz p1, :cond_53

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_53

    if-eqz p2, :cond_53

    .line 96
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_53

    if-eqz p4, :cond_53

    if-nez v0, :cond_1f

    goto :goto_53

    .line 99
    :cond_1f
    new-instance v8, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    move-object v1, v8

    move-object v2, p1

    move-object v3, p2

    move-object v4, v0

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;)V

    move-object v1, v8

    .line 100
    .local v1, "session":Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
    new-instance v2, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$1;

    invoke-direct {v2, p0, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$1;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V

    iput-object v2, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->timeout:Ljava/lang/Runnable;

    .line 105
    iput-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    .line 106
    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->main:Landroid/os/Handler;

    iget-object v3, v1, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->timeout:Ljava/lang/Runnable;

    const-wide/32 v4, 0x493e0

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result v2

    if-nez v2, :cond_46

    .line 107
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
    :try_end_44
    .catchall {:try_start_1 .. :try_end_44} :catchall_55

    .line 108
    monitor-exit p0

    return v7

    .line 110
    .end local p0    # "this":Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;
    :cond_46
    :try_start_46
    iget-object v2, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->activity:Landroid/app/Activity;

    new-instance v3, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;

    invoke-direct {v3, p0, v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$2;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V

    invoke-virtual {v2, v3}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_50
    .catchall {:try_start_46 .. :try_end_50} :catchall_55

    .line 147
    monitor-exit p0

    const/4 v2, 0x1

    return v2

    .line 97
    .end local v1    # "session":Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
    :cond_53
    :goto_53
    monitor-exit p0

    return v7

    .line 93
    .end local v0    # "domain":Ljava/lang/String;
    .end local p1    # "accountKey":Ljava/lang/String;
    .end local p2    # "requestNonce":Ljava/lang/String;
    .end local p3    # "redirect":Ljava/lang/String;
    .end local p4    # "done":Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Completion;
    :catchall_55
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public cancel()V
    .registers 4

    .line 189
    monitor-enter p0

    .line 190
    :try_start_1
    iget-object v0, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    .line 191
    .local v0, "cancelled":Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->pending:Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;

    .line 192
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_1c

    .line 193
    if-nez v0, :cond_a

    return-void

    .line 194
    :cond_a
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->main:Landroid/os/Handler;

    iget-object v2, v0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;->timeout:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 195
    iget-object v1, p0, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;->activity:Landroid/app/Activity;

    new-instance v2, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$3;

    invoke-direct {v2, p0, v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$3;-><init>(Lorg/vtlite/reborn/captcha/RebornCaptchaBridge;Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 205
    return-void

    .line 192
    .end local v0    # "cancelled":Lorg/vtlite/reborn/captcha/RebornCaptchaBridge$Session;
    :catchall_1c
    move-exception v0

    :try_start_1d
    monitor-exit p0
    :try_end_1e
    .catchall {:try_start_1d .. :try_end_1e} :catchall_1c

    throw v0
.end method
