.class public final Lorg/vtlite/reborn/security/AndroidTokenStore;
.super Ljava/lang/Object;
.source "AndroidTokenStore.java"


# static fields
.field private static final LEGACY_PREFS:Ljava/lang/String; = "com.vtosters.lite_pref_name"

.field private static final SECURE_PREFS:Ljava/lang/String; = "reborn_vk_sdk_secure_v1"


# instance fields
.field private final store:Lorg/vtlite/reborn/security/TokenMigrationCore;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 7

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 13
    new-instance v0, Lorg/vtlite/reborn/security/TokenMigrationCore;

    new-instance v1, Lorg/vtlite/reborn/security/AndroidTokenPreferences;

    .line 14
    const-string v2, "com.vtosters.lite_pref_name"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/vtlite/reborn/security/AndroidTokenPreferences;-><init>(Landroid/content/SharedPreferences;)V

    new-instance v2, Lorg/vtlite/reborn/security/AndroidTokenPreferences;

    const-string v4, "reborn_vk_sdk_secure_v1"

    .line 15
    invoke-virtual {p1, v4, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p1

    invoke-direct {v2, p1}, Lorg/vtlite/reborn/security/AndroidTokenPreferences;-><init>(Landroid/content/SharedPreferences;)V

    new-instance p1, Lorg/vtlite/reborn/security/AndroidKeystoreCipherBox;

    invoke-direct {p1}, Lorg/vtlite/reborn/security/AndroidKeystoreCipherBox;-><init>()V

    invoke-direct {v0, v1, v2, p1}, Lorg/vtlite/reborn/security/TokenMigrationCore;-><init>(Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;)V

    iput-object v0, p0, Lorg/vtlite/reborn/security/AndroidTokenStore;->store:Lorg/vtlite/reborn/security/TokenMigrationCore;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 20
    iget-object v0, p0, Lorg/vtlite/reborn/security/AndroidTokenStore;->store:Lorg/vtlite/reborn/security/TokenMigrationCore;

    invoke-virtual {v0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->logout()V

    return-void
.end method

.method public load()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lorg/vtlite/reborn/security/AndroidTokenStore;->store:Lorg/vtlite/reborn/security/TokenMigrationCore;

    invoke-virtual {v0}, Lorg/vtlite/reborn/security/TokenMigrationCore;->readOrMigrate()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public save(Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/vtlite/reborn/security/TokenMigrationCore$SecurityFailure;
        }
    .end annotation

    .line 19
    iget-object v0, p0, Lorg/vtlite/reborn/security/AndroidTokenStore;->store:Lorg/vtlite/reborn/security/TokenMigrationCore;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/security/TokenMigrationCore;->saveNew(Ljava/util/Map;)V

    return-void
.end method
