.class public final Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;
.super Ljava/lang/Object;
.source "WidePreviewLiveAccount.java"


# instance fields
.field private account:Lcom/vk/auth/api/VKAccount;

.field private armed:Z

.field private boundaryEpoch:J

.field private expectedEpoch:J

.field private initialId:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static enabledForProduction()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method private static readCurrent()Lcom/vk/auth/api/VKAccount;
    .registers 3

    :try_start_0
    new-instance v0, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;

    invoke-direct {v0}, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;-><init>()V

    invoke-virtual {v0}, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;->currentAccount()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/auth/api/VKAccount;

    if-eqz v0, :cond_20

    invoke-virtual {v0}, Lcom/vk/auth/api/VKAccount;->b1()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-virtual {v0}, Lcom/vk/auth/api/VKAccount;->D0()I

    move-result v1

    if-lez v1, :cond_20

    const v2, 0x77359400

    if-ge v1, v2, :cond_20

    return-object v0
    :try_end_1f
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_1f} :catch_1f
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_1f} :catch_1f

    :catch_1f
    move-exception v0

    :cond_20
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public pin(J)Ljava/lang/Object;
    .registers 9

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->reset()V

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_33

    invoke-static {}, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->readCurrent()Lcom/vk/auth/api/VKAccount;

    move-result-object v0

    if-eqz v0, :cond_33

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->rebornQaGenerationFor(Ljava/lang/Object;)J

    move-result-wide v3

    const-wide/16 v1, 0x0

    cmp-long v5, v3, v1

    if-lez v5, :cond_1a

    goto :goto_33

    :cond_1a
    const-wide v1, 0x7fffffffffffffffL

    cmp-long v5, v3, v1

    if-eqz v5, :cond_33

    invoke-virtual {v0}, Lcom/vk/auth/api/VKAccount;->D0()I

    move-result v1

    iput-object v0, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->account:Lcom/vk/auth/api/VKAccount;

    iput v1, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->initialId:I

    iput-wide p1, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->expectedEpoch:J

    iput-wide v3, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->boundaryEpoch:J

    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->armed:Z

    return-object v0

    :cond_33
    :goto_33
    const/4 v0, 0x0

    return-object v0
.end method

.method public recheck(J)Ljava/lang/Object;
    .registers 9

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->armed:Z

    if-eqz v0, :cond_36

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-lez v0, :cond_33

    iget-wide v0, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->expectedEpoch:J

    cmp-long v0, v0, p1

    if-nez v0, :cond_33

    invoke-static {}, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->readCurrent()Lcom/vk/auth/api/VKAccount;

    move-result-object v0

    if-eqz v0, :cond_33

    iget-object v1, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->account:Lcom/vk/auth/api/VKAccount;

    if-ne v0, v1, :cond_33

    invoke-virtual {v0}, Lcom/vk/auth/api/VKAccount;->D0()I

    move-result v1

    iget v2, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->initialId:I

    if-ne v1, v2, :cond_33

    invoke-static {v0}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->rebornQaGenerationFor(Ljava/lang/Object;)J

    move-result-wide v3

    iget-wide v1, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->boundaryEpoch:J

    cmp-long v5, v3, v1

    if-nez v5, :cond_33

    const-wide/16 v1, 0x0

    cmp-long v5, v3, v1

    if-lez v5, :cond_33

    return-object v0

    :cond_33
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->reset()V

    :cond_36
    const/4 v0, 0x0

    return-object v0
.end method

.method public reset()V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->account:Lcom/vk/auth/api/VKAccount;

    iput v0, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->initialId:I

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->armed:Z

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->expectedEpoch:J

    iput-wide v0, p0, Lorg/vtlite/reborn/id64/WidePreviewLiveAccount;->boundaryEpoch:J

    return-void
.end method
