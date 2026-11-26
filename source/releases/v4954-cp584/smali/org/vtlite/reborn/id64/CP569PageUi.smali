.class public final Lorg/vtlite/reborn/id64/CP569PageUi;
.super Ljava/lang/Object;


# direct methods
.method public static event(Ljava/lang/String;)V
    .registers 3

    :try_start_0
    sget-object v0, Lcom/vk/log/L$LogType;->i:Lcom/vk/log/L$LogType;

    const-string v1, "RebornCP569"

    invoke-static {v0, v1, p0}, Lcom/vk/log/L;->a(Lcom/vk/log/L$LogType;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_7} :catch_8
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_7} :catch_8

    return-void

    :catch_8
    move-exception v0

    return-void
.end method

.method static nativePeer(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)I
    .registers 7

    if-eqz p0, :cond_25

    iget-wide v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    long-to-int v2, v0

    if-eqz v2, :cond_25

    int-to-long v3, v2

    cmp-long v5, v0, v3

    if-nez v5, :cond_25

    iget-object v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-eqz v0, :cond_25

    invoke-static {v2}, Lcom/vk/im/engine/utils/ImDialogsUtils;->d(I)Lcom/vk/im/engine/models/PeerType;

    move-result-object v1

    if-eqz v1, :cond_25

    invoke-virtual {v0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_25

    return v2

    :cond_25
    const/4 v0, 0x0

    return v0
.end method

.method static open(Lorg/vtlite/reborn/id64/CP528ListScreen;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)V
    .registers 5

    :try_start_0
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Valid()Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-static {p1}, Lorg/vtlite/reborn/id64/CP569PageUi;->nativePeer(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)I

    move-result v0

    if-eqz v0, :cond_27

    new-instance v1, Lcom/vk/im/ui/fragments/ChatFragmentBuilder;

    invoke-direct {v1}, Lcom/vk/im/ui/fragments/ChatFragmentBuilder;-><init>()V

    invoke-virtual {v1, v0}, Lcom/vk/im/ui/fragments/ChatFragmentBuilder;->c(I)Lcom/vk/im/ui/fragments/ChatFragmentBuilder;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/CP528ListScreen;->cp556Valid()Z

    move-result v0

    if-eqz v0, :cond_3a

    invoke-virtual {v1, v2}, Lcom/vk/navigation/Navigator;->a(Landroid/content/Context;)V

    const-string v0, "NATIVE_CHAT_DISPATCHED"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/CP569PageUi;->event(Ljava/lang/String;)V

    goto :goto_3a

    :cond_27
    const-string v0, "HISTORY_PEER_UNREPRESENTABLE"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/CP569PageUi;->event(Ljava/lang/String;)V

    const-string v0, "\u0418\u0441\u0442\u043e\u0440\u0438\u044f \u044d\u0442\u043e\u0433\u043e \u0434\u0438\u0430\u043b\u043e\u0433\u0430 \u043f\u043e\u043a\u0430 \u043d\u0435\u0434\u043e\u0441\u0442\u0443\u043f\u043d\u0430 \u0432 \u044d\u0442\u043e\u0439 \u0432\u0435\u0440\u0441\u0438\u0438."

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V
    :try_end_3a
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_3a} :catch_3b
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_3a} :catch_3b

    :cond_3a
    :goto_3a
    return-void

    :catch_3b
    move-exception v0

    const-string v0, "NATIVE_CHAT_UNAVAILABLE"

    invoke-static {v0}, Lorg/vtlite/reborn/id64/CP569PageUi;->event(Ljava/lang/String;)V

    return-void
.end method
