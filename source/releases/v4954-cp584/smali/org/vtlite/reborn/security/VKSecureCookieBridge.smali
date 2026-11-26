.class public final Lorg/vtlite/reborn/security/VKSecureCookieBridge;
.super Ljava/lang/Object;
.source "VKSecureCookieBridge.java"


# static fields
.field private static final LEGACY:Ljava/lang/String; = "CookiePersistence"

.field private static final SECURE:Ljava/lang/String; = "RebornEncryptedCookieJar"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clear()V
    .registers 2

    .line 59
    :try_start_0
    invoke-static {}, Lorg/vtlite/reborn/security/VKSecureCookieBridge;->store()Lorg/vtlite/reborn/security/CookieJarMigrationCore;

    move-result-object v0

    invoke-virtual {v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->clear()V
    :try_end_7
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_0 .. :try_end_7} :catch_8

    return-void

    .line 60
    :catch_8
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "encrypted cookie clear unavailable"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private static key(Lokhttp3/Cookie;)Ljava/lang/String;
    .registers 3

    .line 23
    invoke-virtual {p0}, Lokhttp3/Cookie;->h()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "https"

    goto :goto_b

    :cond_9
    const-string v0, "http"

    .line 24
    :goto_b
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "://"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lokhttp3/Cookie;->a()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lokhttp3/Cookie;->f()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "|"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lokhttp3/Cookie;->e()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static load()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lokhttp3/Cookie;",
            ">;"
        }
    .end annotation

    .line 28
    :try_start_0
    invoke-static {}, Lorg/vtlite/reborn/security/VKSecureCookieBridge;->store()Lorg/vtlite/reborn/security/CookieJarMigrationCore;

    move-result-object v0

    invoke-virtual {v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->load()Ljava/util/Map;

    move-result-object v0

    .line 29
    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 30
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 31
    new-instance v3, Lcom/vk/core/network/cookies/persistence/SerializableCookie;

    invoke-direct {v3}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;-><init>()V

    invoke-virtual {v3, v2}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->a(Ljava/lang/String;)Lokhttp3/Cookie;

    move-result-object v2

    if-eqz v2, :cond_34

    .line 33
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_19

    .line 32
    :cond_34
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "invalid stored cookie"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3c
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_0 .. :try_end_3c} :catch_45
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_3c} :catch_3d

    :cond_3c
    return-object v1

    .line 38
    :catch_3d
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "invalid cookie store"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :catch_45
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "encrypted cookie store unavailable"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static remove(Ljava/util/Collection;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lokhttp3/Cookie;",
            ">;)V"
        }
    .end annotation

    .line 51
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 52
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokhttp3/Cookie;

    invoke-static {v1}, Lorg/vtlite/reborn/security/VKSecureCookieBridge;->key(Lokhttp3/Cookie;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_9

    .line 53
    :cond_1d
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_24

    return-void

    .line 54
    :cond_24
    :try_start_24
    invoke-static {}, Lorg/vtlite/reborn/security/VKSecureCookieBridge;->store()Lorg/vtlite/reborn/security/CookieJarMigrationCore;

    move-result-object p0

    invoke-virtual {p0, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->remove(Ljava/util/Collection;)V
    :try_end_2b
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_24 .. :try_end_2b} :catch_2c

    return-void

    .line 55
    :catch_2c
    new-instance p0, Ljava/lang/SecurityException;

    const-string v0, "encrypted cookie removal unavailable"

    invoke-direct {p0, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static save(Ljava/util/Collection;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lokhttp3/Cookie;",
            ">;)V"
        }
    .end annotation

    .line 41
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 42
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_9
    :goto_9
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2c

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lokhttp3/Cookie;

    invoke-virtual {v1}, Lokhttp3/Cookie;->g()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 43
    invoke-static {v1}, Lorg/vtlite/reborn/security/VKSecureCookieBridge;->key(Lokhttp3/Cookie;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lcom/vk/core/network/cookies/persistence/SerializableCookie;

    invoke-direct {v3}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;-><init>()V

    invoke-virtual {v3, v1}, Lcom/vk/core/network/cookies/persistence/SerializableCookie;->a(Lokhttp3/Cookie;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_9

    .line 45
    :cond_2c
    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_33

    return-void

    .line 46
    :cond_33
    :try_start_33
    invoke-static {}, Lorg/vtlite/reborn/security/VKSecureCookieBridge;->store()Lorg/vtlite/reborn/security/CookieJarMigrationCore;

    move-result-object p0

    invoke-virtual {p0, v0}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;->merge(Ljava/util/Map;)V
    :try_end_3a
    .catch Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure; {:try_start_33 .. :try_end_3a} :catch_3b

    return-void

    .line 47
    :catch_3b
    new-instance p0, Ljava/lang/SecurityException;

    const-string v0, "encrypted cookie write unavailable"

    invoke-direct {p0, v0}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static store()Lorg/vtlite/reborn/security/CookieJarMigrationCore;
    .registers 4

    .line 17
    const-string v0, "CookiePersistence"

    invoke-static {v0}, Lcom/vk/core/preference/Preference;->a(Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 18
    const-string v1, "RebornEncryptedCookieJar"

    invoke-static {v1}, Lcom/vk/core/preference/Preference;->a(Ljava/lang/String;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 19
    new-instance v2, Lorg/vtlite/reborn/security/CookieJarMigrationCore;

    new-instance v3, Lorg/vtlite/reborn/security/AndroidTokenPreferences;

    invoke-direct {v3, v0}, Lorg/vtlite/reborn/security/AndroidTokenPreferences;-><init>(Landroid/content/SharedPreferences;)V

    new-instance v0, Lorg/vtlite/reborn/security/AndroidTokenPreferences;

    invoke-direct {v0, v1}, Lorg/vtlite/reborn/security/AndroidTokenPreferences;-><init>(Landroid/content/SharedPreferences;)V

    new-instance v1, Lorg/vtlite/reborn/security/AndroidKeystoreCipherBox;

    invoke-direct {v1}, Lorg/vtlite/reborn/security/AndroidKeystoreCipherBox;-><init>()V

    invoke-direct {v2, v3, v0, v1}, Lorg/vtlite/reborn/security/CookieJarMigrationCore;-><init>(Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;)V

    return-object v2
.end method
