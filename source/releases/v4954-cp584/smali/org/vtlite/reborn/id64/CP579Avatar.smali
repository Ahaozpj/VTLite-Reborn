.class final Lorg/vtlite/reborn/id64/CP579Avatar;
.super Ljava/lang/Object;


# direct methods
.method static bind(Landroid/widget/FrameLayout;Ljava/lang/String;)V
    .registers 6

    invoke-static {p0}, Lorg/vtlite/reborn/id64/CP579Avatar;->clear(Landroid/widget/FrameLayout;)V

    invoke-static {p1}, Lorg/vtlite/reborn/id64/CP579Avatar;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_30

    :try_start_9
    new-instance v0, Lcom/vk/im/ui/views/FrescoImageView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/im/ui/views/FrescoImageView;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/im/ui/views/FrescoImageView;->setIsCircle(Z)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setFocusable(Z)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    new-instance v1, Lcom/vk/im/engine/models/Image;

    const/16 v2, 0x64

    invoke-direct {v1, v2, v2, p1}, Lcom/vk/im/engine/models/Image;-><init>(IILjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vk/im/ui/views/FrescoImageView;->setRemoteImage(Lcom/vk/im/engine/models/Image;)V

    const/4 v1, -0x1

    invoke-virtual {p0, v0, v1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;II)V
    :try_end_2b
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_2b} :catch_2c

    goto :goto_30

    :catch_2c
    move-exception v0

    invoke-static {p0}, Lorg/vtlite/reborn/id64/CP579Avatar;->clear(Landroid/widget/FrameLayout;)V

    :cond_30
    :goto_30
    return-void
.end method

.method static clear(Landroid/widget/FrameLayout;)V
    .registers 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Lcom/vk/im/ui/views/FrescoImageView;

    if-eqz v2, :cond_13

    check-cast v1, Lcom/vk/im/ui/views/FrescoImageView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1, v0}, Lcom/vk/im/ui/views/FrescoImageView;->setRemoteImage(Lcom/vk/im/engine/models/Image;)V

    :cond_13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    return-void
.end method

.method static photo(Ljava/util/Map;)Ljava/lang/String;
    .registers 3

    if-eqz p0, :cond_25

    const-string v0, "photo_100"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorg/vtlite/reborn/id64/CP579Avatar;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_24

    const-string v0, "photo_50"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorg/vtlite/reborn/id64/CP579Avatar;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_24

    const-string v0, "photo_200"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lorg/vtlite/reborn/id64/CP579Avatar;->safe(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :cond_24
    return-object v0

    :cond_25
    const/4 v0, 0x0

    return-object v0
.end method

.method static safe(Ljava/lang/Object;)Ljava/lang/String;
    .registers 5

    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_56

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x800

    if-gt v0, v1, :cond_56

    :try_start_e
    new-instance v0, Ljava/net/URI;

    invoke-direct {v0, p0}, Ljava/net/URI;-><init>(Ljava/lang/String;)V

    const-string v1, "https"

    invoke-virtual {v0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_56

    invoke-virtual {v0}, Ljava/net/URI;->getRawUserInfo()Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_56

    invoke-virtual {v0}, Ljava/net/URI;->getPort()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_30

    const/16 v2, 0x1bb

    if-ne v1, v2, :cond_56

    :cond_30
    invoke-virtual {v0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_56

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ".userapi.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_54

    const-string v1, ".vkuserphoto.ru"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_54

    const-string v1, ".vk.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_56

    :cond_54
    return-object p0
    :try_end_55
    .catch Ljava/net/URISyntaxException; {:try_start_e .. :try_end_55} :catch_55

    :catch_55
    move-exception v0

    :cond_56
    const/4 v0, 0x0

    return-object v0
.end method
