.class public final Lorg/vtlite/reborn/id64/CP518ImOrigin;
.super Ljava/lang/Object;


# instance fields
.field private final env:Lcom/vk/im/engine/ImEnvironment;

.field private final manager:Lcom/vk/api/sdk/VKApiManager;


# direct methods
.method public constructor <init>(Lcom/vk/im/engine/ImEnvironment;Lcom/vk/api/sdk/VKApiManager;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/CP518ImOrigin;->env:Lcom/vk/im/engine/ImEnvironment;

    iput-object p2, p0, Lorg/vtlite/reborn/id64/CP518ImOrigin;->manager:Lcom/vk/api/sdk/VKApiManager;

    return-void
.end method


# virtual methods
.method public cp530TransportStamp()Ljava/lang/Object;
    .registers 3

    const/4 v0, 0x0

    :try_start_1
    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP518ImOrigin;->manager:Lcom/vk/api/sdk/VKApiManager;

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Lcom/vk/api/sdk/VKApiManager;->b()Lcom/vk/api/sdk/okhttp/OkHttpExecutor;

    move-result-object v1

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Lcom/vk/api/sdk/okhttp/OkHttpExecutor;->cp530Stamp()Ljava/lang/Object;

    move-result-object v0
    :try_end_f
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_f} :catch_10
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_f} :catch_10

    :cond_f
    return-object v0

    :catch_10
    move-exception v1

    return-object v0
.end method

.method public cp553MatchesTransportOwner(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p1, :cond_15

    if-eqz p2, :cond_15

    :try_start_5
    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/CP518ImOrigin;->current(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z

    move-result v1

    if-eqz v1, :cond_15

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP518ImOrigin;->manager:Lcom/vk/api/sdk/VKApiManager;

    invoke-virtual {v1}, Lcom/vk/api/sdk/VKApiManager;->b()Lcom/vk/api/sdk/okhttp/OkHttpExecutor;

    move-result-object v1

    invoke-virtual {p1, v1, p2}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->cp553MatchesExecutor(Lcom/vk/api/sdk/okhttp/OkHttpExecutor;Ljava/lang/Object;)Z

    move-result v0
    :try_end_15
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_15} :catch_16
    .catch Ljava/lang/LinkageError; {:try_start_5 .. :try_end_15} :catch_16

    :cond_15
    return v0

    :catch_16
    move-exception v1

    const/4 v0, 0x0

    return v0
.end method

.method public current(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;)Z
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP518ImOrigin;->manager:Lcom/vk/api/sdk/VKApiManager;

    invoke-virtual {p0, p1, v0}, Lorg/vtlite/reborn/id64/CP518ImOrigin;->matches(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lcom/vk/api/sdk/VKApiManager;)Z

    move-result v0

    return v0
.end method

.method public matches(Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;Lcom/vk/api/sdk/VKApiManager;)Z
    .registers 7

    const/4 v0, 0x0

    if-eqz p1, :cond_30

    if-eqz p2, :cond_30

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP518ImOrigin;->manager:Lcom/vk/api/sdk/VKApiManager;

    if-ne v1, p2, :cond_30

    iget-object v2, p0, Lorg/vtlite/reborn/id64/CP518ImOrigin;->env:Lcom/vk/im/engine/ImEnvironment;

    if-eqz v2, :cond_30

    :try_start_d
    invoke-virtual {p1}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->isCurrent()Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-interface {v2}, Lcom/vk/im/engine/ImEnvironment;->k0()Lcom/vk/api/internal/ApiManager;

    move-result-object v3

    if-ne v1, v3, :cond_30

    invoke-interface {v2}, Lcom/vk/im/engine/ImEnvironment;->Z()Lcom/vk/im/engine/models/Member;

    move-result-object v3

    invoke-virtual {p1, v3}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->cp518MatchesMember(Lcom/vk/im/engine/models/Member;)Z

    move-result v3

    if-eqz v3, :cond_30

    invoke-interface {v2}, Lcom/vk/im/engine/ImEnvironment;->k0()Lcom/vk/api/internal/ApiManager;

    move-result-object v3

    if-ne v1, v3, :cond_30

    invoke-virtual {p1}, Lorg/vtlite/reborn/id64/WideDispatchSessionTicket;->isCurrent()Z

    move-result v3

    if-eqz v3, :cond_30

    const/4 v0, 0x1
    :try_end_30
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_30} :catch_31
    .catch Ljava/lang/LinkageError; {:try_start_d .. :try_end_30} :catch_31

    :cond_30
    return v0

    :catch_31
    move-exception v3

    const/4 v0, 0x0

    return v0
.end method
