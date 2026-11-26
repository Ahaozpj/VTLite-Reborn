.class public final Lorg/vtlite/reborn/id64/CP567ClientTrace;
.super Ljava/lang/Object;


# static fields
.field private static final scope:Ljava/lang/ThreadLocal;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lorg/vtlite/reborn/id64/CP567ClientTrace;->scope:Ljava/lang/ThreadLocal;

    return-void
.end method

.method public static begin(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 7

    invoke-static {}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->clear()V

    :try_start_3
    if-eqz p1, :cond_32

    if-eqz p2, :cond_32

    instance-of v0, p0, Lcom/vk/api/sdk/okhttp/OkHttpMethodCall;

    if-eqz v0, :cond_32

    move-object v0, p0

    check-cast v0, Lcom/vk/api/sdk/okhttp/OkHttpMethodCall;

    invoke-virtual {v0}, Lcom/vk/api/sdk/okhttp/OkHttpMethodCall;->b()Ljava/lang/String;

    move-result-object v0

    const-string v1, "messages.getConversations"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/Object;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lorg/vtlite/reborn/id64/CP567ClientTrace;->scope:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V
    :try_end_32
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_32} :catch_33
    .catch Ljava/lang/LinkageError; {:try_start_3 .. :try_end_32} :catch_33

    :cond_32
    return-void

    :catch_33
    move-exception v0

    return-void
.end method

.method public static clear()V
    .registers 1

    sget-object v0, Lorg/vtlite/reborn/id64/CP567ClientTrace;->scope:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    return-void
.end method

.method public static record(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 8

    :try_start_0
    if-eqz p0, :cond_38

    if-eqz p1, :cond_38

    if-eqz p2, :cond_38

    if-eqz p3, :cond_38

    sget-object v0, Lorg/vtlite/reborn/id64/CP567ClientTrace;->scope:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_38

    check-cast v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->ref([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p0, :cond_38

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->ref([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_38

    const/4 v1, 0x2

    aget-object v2, v0, v1

    if-nez v2, :cond_35

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    aput-object v2, v0, v1

    const/4 v1, 0x3

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    aput-object v2, v0, v1

    goto :goto_38

    :cond_35
    invoke-static {}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->clear()V
    :try_end_38
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_38} :catch_39
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_38} :catch_39

    :cond_38
    :goto_38
    return-void

    :catch_39
    move-exception v0

    invoke-static {}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->clear()V

    return-void
.end method

.method private static ref([Ljava/lang/Object;I)Ljava/lang/Object;
    .registers 3

    aget-object v0, p0, p1

    if-eqz v0, :cond_a

    check-cast v0, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    :cond_a
    return-object v0
.end method

.method public static take(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 7

    :try_start_0
    sget-object v0, Lorg/vtlite/reborn/id64/CP567ClientTrace;->scope:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    if-eqz v1, :cond_2f

    if-eqz p0, :cond_2f

    if-eqz p1, :cond_2f

    if-eqz p2, :cond_2f

    check-cast v1, [Ljava/lang/Object;

    const/4 v0, 0x0

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->ref([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p0, :cond_2f

    const/4 v0, 0x1

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->ref([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p1, :cond_2f

    const/4 v0, 0x2

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->ref([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, p2, :cond_2f

    const/4 v0, 0x3

    invoke-static {v1, v0}, Lorg/vtlite/reborn/id64/CP567ClientTrace;->ref([Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    return-object v2
    :try_end_2e
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_2e} :catch_2e
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_2e} :catch_2e

    :catch_2e
    move-exception v0

    :cond_2f
    const/4 v0, 0x0

    return-object v0
.end method
