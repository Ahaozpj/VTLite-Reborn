.class public final Lorg/vtlite/reborn/id64/CP566ProviderTrace;
.super Ljava/lang/Object;


# static fields
.field private static final scope:Ljava/lang/ThreadLocal;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/id64/CP566ProviderTrace;->scope:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public static clear()V
    .registers 1

    sget-object v0, Lorg/vtlite/reborn/id64/CP566ProviderTrace;->scope:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    invoke-static {}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->clear()V

    return-void
.end method

.method public static mark(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;I)V
    .registers 9

    invoke-static {}, Lorg/vtlite/reborn/id64/CP566ProviderTrace;->clear()V

    :try_start_3
    if-eqz p0, :cond_53

    if-eqz p1, :cond_53

    if-eqz p2, :cond_53

    if-eqz p3, :cond_53

    instance-of v0, p0, Lcom/vk/api/sdk/okhttp/OkHttpMethodCall;

    if-eqz v0, :cond_53

    move-object v0, p0

    check-cast v0, Lcom/vk/api/sdk/okhttp/OkHttpMethodCall;

    invoke-virtual {v0}, Lcom/vk/api/sdk/okhttp/OkHttpMethodCall;->b()Ljava/lang/String;

    move-result-object v0

    const-string v1, "messages.getConversations"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_53

    const/4 v0, 0x1

    if-eq p4, v0, :cond_24

    const/4 v0, 0x2

    if-ne p4, v0, :cond_53

    :cond_24
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lorg/vtlite/reborn/id64/CP566ProviderTrace;->scope:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_53
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_53} :catch_54
    .catch Ljava/lang/LinkageError; {:try_start_3 .. :try_end_53} :catch_54

    :cond_53
    return-void

    :catch_54
    move-exception v0

    return-void
.end method

.method public static note(I)V
    .registers 4

    :try_start_0
    const/4 v0, 0x1

    if-ne p0, v0, :cond_6

    const-string v0, "PROVIDER_OKHTTP_BRANCH"

    goto :goto_e

    :cond_6
    const/4 v0, 0x2

    if-ne p0, v0, :cond_c

    const-string v0, "PROVIDER_HTTP_EXECUTOR_BRANCH"

    goto :goto_e

    :cond_c
    const-string v0, "PROVIDER_OBSERVATION_MISSING"

    :goto_e
    sget-object v1, Lcom/vk/log/L$LogType;->i:Lcom/vk/log/L$LogType;

    const-string v2, "RebornCP566"

    invoke-static {v1, v2, v0}, Lcom/vk/log/L;->a(Lcom/vk/log/L$LogType;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_15
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_15} :catch_16
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_15} :catch_16

    return-void

    :catch_16
    move-exception v0

    return-void
.end method

.method public static take(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)I
    .registers 8

    const/4 v4, 0x0

    :try_start_1
    sget-object v0, Lorg/vtlite/reborn/id64/CP566ProviderTrace;->scope:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    if-eqz v1, :cond_50

    if-eqz p0, :cond_50

    if-eqz p1, :cond_50

    if-eqz p2, :cond_50

    check-cast v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aget-object v0, v1, v2

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_50

    const/4 v2, 0x1

    aget-object v0, v1, v2

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p1, :cond_50

    const/4 v2, 0x2

    aget-object v0, v1, v2

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_50

    const/4 v2, 0x3

    aget-object v0, v1, v2

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p2, :cond_50

    const/4 v2, 0x4

    aget-object v0, v1, v2

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_4f

    const/4 v2, 0x2

    if-ne v0, v2, :cond_50

    :cond_4f
    move v4, v0
    :try_end_50
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_50} :catch_51
    .catch Ljava/lang/LinkageError; {:try_start_1 .. :try_end_50} :catch_51

    :cond_50
    return v4

    :catch_51
    move-exception v0

    const/4 v4, 0x0

    return v4
.end method
