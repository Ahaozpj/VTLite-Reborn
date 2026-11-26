.class public interface abstract Lorg/vtlite/reborn/security/TokenMigrationCore$Preferences;
.super Ljava/lang/Object;
.source "TokenMigrationCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/security/TokenMigrationCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "Preferences"
.end annotation


# virtual methods
.method public abstract clear()Z
.end method

.method public abstract put(Ljava/lang/String;Ljava/lang/String;)Z
.end method

.method public abstract readAll()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract remove(Ljava/util/Set;)Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation
.end method
