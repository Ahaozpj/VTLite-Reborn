.class public final Lorg/vtlite/reborn/security/VKSecureTokenBridge;
.super Ljava/lang/Object;
.source "VKSecureTokenBridge.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clear(Landroid/content/Context;)V
    .registers 2

    .line 33
    :try_start_0
    new-instance v0, Lorg/vtlite/reborn/security/AndroidTokenStore;

    invoke-direct {v0, p0}, Lorg/vtlite/reborn/security/AndroidTokenStore;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lorg/vtlite/reborn/security/AndroidTokenStore;->clear()V
    :try_end_8
    .catch Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure; {:try_start_0 .. :try_end_8} :catch_9

    return-void

    .line 35
    :catch_9
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Secure SDK token erase failed"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static load(Landroid/content/Context;)Lcom/vk/api/sdk/auth/VKAccessToken;
    .registers 3

    const/4 v0, 0x0

    .line 13
    :try_start_1
    new-instance v1, Lorg/vtlite/reborn/security/AndroidTokenStore;

    invoke-direct {v1, p0}, Lorg/vtlite/reborn/security/AndroidTokenStore;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Lorg/vtlite/reborn/security/AndroidTokenStore;->load()Ljava/util/Map;

    move-result-object p0

    if-nez p0, :cond_d

    goto :goto_13

    .line 14
    :cond_d
    new-instance v1, Lcom/vk/api/sdk/auth/VKAccessToken;

    invoke-direct {v1, p0}, Lcom/vk/api/sdk/auth/VKAccessToken;-><init>(Ljava/util/Map;)V
    :try_end_12
    .catch Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure; {:try_start_1 .. :try_end_12} :catch_13

    move-object v0, v1

    :catch_13
    :goto_13
    return-object v0
.end method

.method public static save(Landroid/content/Context;Lcom/vk/api/sdk/auth/VKAccessToken;)V
    .registers 3

    .line 26
    :try_start_0
    new-instance v0, Lorg/vtlite/reborn/security/AndroidTokenStore;

    invoke-direct {v0, p0}, Lorg/vtlite/reborn/security/AndroidTokenStore;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Lcom/vk/api/sdk/auth/VKAccessToken;->exportForSecureStorage()Ljava/util/Map;

    move-result-object p0

    invoke-virtual {v0, p0}, Lorg/vtlite/reborn/security/AndroidTokenStore;->save(Ljava/util/Map;)V
    :try_end_c
    .catch Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure; {:try_start_0 .. :try_end_c} :catch_d

    return-void

    .line 28
    :catch_d
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Secure SDK token write failed"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
