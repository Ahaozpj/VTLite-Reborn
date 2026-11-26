.class public final Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;
.super Ljava/lang/Object;
.source "WideDispatchSessionTicket.java"

# interfaces
.implements Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;


# instance fields
.field private final account:Lcom/vk/auth/api/VKAccount;

.field private final accountId:I

.field private final mutationEpoch:J


# direct methods
.method private constructor <init>(Lcom/vk/auth/api/VKAccount;IJ)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->account:Lcom/vk/auth/api/VKAccount;

    iput p2, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->accountId:I

    iput-wide p3, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->mutationEpoch:J

    return-void
.end method

.method public static capture()Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;
    .registers 10

    :try_start_0
    new-instance v0, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;

    invoke-direct {v0}, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;-><init>()V

    invoke-virtual {v0}, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;->currentAccount()Ljava/lang/Object;

    move-result-object v1

    instance-of v5, v1, Lcom/vk/auth/api/VKAccount;

    if-eqz v5, :cond_48

    check-cast v1, Lcom/vk/auth/api/VKAccount;

    invoke-virtual {v1}, Lcom/vk/auth/api/VKAccount;->b1()Z

    move-result v5

    if-eqz v5, :cond_48

    invoke-virtual {v1}, Lcom/vk/auth/api/VKAccount;->D0()I

    move-result v2

    if-lez v2, :cond_48

    const v5, 0x77359400

    if-ge v2, v5, :cond_48

    invoke-static {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->rebornQaGenerationFor(Ljava/lang/Object;)J

    move-result-wide v3

    const-wide/16 v6, 0x0

    cmp-long v5, v3, v6

    if-lez v5, :cond_48

    const-wide v6, 0x7fffffffffffffffL

    cmp-long v5, v3, v6

    if-eqz v5, :cond_48

    invoke-virtual {v0}, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;->currentAccount()Ljava/lang/Object;

    move-result-object v5

    if-ne v5, v1, :cond_48

    invoke-static {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->rebornQaGenerationFor(Ljava/lang/Object;)J

    move-result-wide v6

    cmp-long v8, v3, v6

    if-nez v8, :cond_48

    new-instance v5, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;

    invoke-direct {v5, v1, v2, v3, v4}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;-><init>(Lcom/vk/auth/api/VKAccount;IJ)V

    return-object v5
    :try_end_47
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_47} :catch_47
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_47} :catch_47

    :catch_47
    move-exception v0

    :cond_48
    const/4 v0, 0x0

    return-object v0
.end method

.method public static cp510SameGeneration(Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;Lorg/vtlite/reborn/id64/ScopedDialogDelivery$Session;)Z
    .registers 8

    instance-of v0, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;

    if-eqz v0, :cond_3a

    instance-of v0, p1, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;

    if-eqz v0, :cond_3a

    check-cast p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;

    check-cast p1, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->account:Lcom/vk/auth/api/VKAccount;

    if-eqz v0, :cond_3a

    iget-object v1, p1, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->account:Lcom/vk/auth/api/VKAccount;

    if-ne v0, v1, :cond_3a

    iget v0, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->accountId:I

    iget v1, p1, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->accountId:I

    if-ne v0, v1, :cond_3a

    if-lez v0, :cond_3a

    const v1, 0x77359400

    if-ge v0, v1, :cond_3a

    iget-wide v2, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->mutationEpoch:J

    iget-wide v4, p1, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->mutationEpoch:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_3a

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-lez v0, :cond_3a

    const-wide v4, 0x7fffffffffffffffL

    cmp-long v0, v2, v4

    if-eqz v0, :cond_3a

    const/4 v0, 0x1

    return v0

    :cond_3a
    const/4 v0, 0x0

    return v0
.end method

.method public static enabledForProduction()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method public static enabledForReceiptQa()Z
    .registers 1

    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method public cp518MatchesMember(Lcom/vk/im/engine/models/Member;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_12

    iget v1, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->accountId:I

    if-lez v1, :cond_12

    const v2, 0x77359400

    if-ge v1, v2, :cond_12

    sget-object v2, Lcom/vk/im/engine/models/MemberType;->USER:Lcom/vk/im/engine/models/MemberType;

    invoke-virtual {p1, v2, v1}, Lcom/vk/im/engine/models/Member;->b(Lcom/vk/im/engine/models/MemberType;I)Z

    move-result v0

    :cond_12
    return v0
.end method

.method public cp553MatchesExecutor(Lcom/vk/api/sdk/okhttp/OkHttpExecutor;Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_17

    if-eqz p2, :cond_17

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->isCurrent()Z

    move-result v1

    if-eqz v1, :cond_17

    iget v1, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->accountId:I

    invoke-virtual {p1, p2, v1}, Lcom/vk/api/sdk/okhttp/OkHttpExecutor;->cp553MatchesImOwner(Ljava/lang/Object;I)Z

    move-result v1

    if-eqz v1, :cond_17

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->isCurrent()Z

    move-result v0

    :cond_17
    return v0
.end method

.method public isCurrent()Z
    .registers 10

    :try_start_0
    iget-object v1, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->account:Lcom/vk/auth/api/VKAccount;

    if-eqz v1, :cond_39

    new-instance v0, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;

    invoke-direct {v0}, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;-><init>()V

    invoke-virtual {v0}, Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;->currentAccount()Ljava/lang/Object;

    move-result-object v2

    if-ne v1, v2, :cond_39

    invoke-virtual {v1}, Lcom/vk/auth/api/VKAccount;->b1()Z

    move-result v2

    if-eqz v2, :cond_39

    invoke-virtual {v1}, Lcom/vk/auth/api/VKAccount;->D0()I

    move-result v2

    iget v3, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->accountId:I

    if-ne v2, v3, :cond_39

    invoke-static {v1}, Lorg/vtlite/reborn/captcha/RebornCaptchaAccountHooks;->rebornQaGenerationFor(Ljava/lang/Object;)J

    move-result-wide v3

    iget-wide v5, p0, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->mutationEpoch:J

    cmp-long v7, v3, v5

    if-nez v7, :cond_39

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_39

    const-wide v5, 0x7fffffffffffffffL

    cmp-long v7, v3, v5

    if-eqz v7, :cond_39

    const/4 v0, 0x1

    return v0
    :try_end_38
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_38} :catch_38
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_38} :catch_38

    :catch_38
    move-exception v0

    :cond_39
    const/4 v0, 0x0

    return v0
.end method
