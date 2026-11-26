.class public interface abstract Lorg/vtlite/reborn/security/TokenMigrationCore$CipherBox;
.super Ljava/lang/Object;
.source "TokenMigrationCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/security/TokenMigrationCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "CipherBox"
.end annotation


# virtual methods
.method public abstract decrypt([B[B)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public abstract encrypt([B[B)[B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
