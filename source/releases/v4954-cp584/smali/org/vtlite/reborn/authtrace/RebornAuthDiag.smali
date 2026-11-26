.class public final Lorg/vtlite/reborn/authtrace/RebornAuthDiag;
.super Ljava/lang/Object;
.source "RebornAuthDiag.java"


# static fields
.field private static bf:I

.field private static en:I

.field private static ip:I

.field private static lc:I

.field private static lo:I

.field private static up:I


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bruteforceSeen()V
    .registers 1

    sget v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->bf:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->bf:I

    return-void
.end method

.method public static enqueue()V
    .registers 1

    sget v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->en:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->en:I

    return-void
.end method

.method public static inPlaceUpdate()V
    .registers 1

    sget v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->ip:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->ip:I

    return-void
.end method

.method public static loginCommit()V
    .registers 1

    sget v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->lc:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->lc:I

    return-void
.end method

.method public static logout()V
    .registers 1

    sget v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->lo:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->lo:I

    return-void
.end method

.method public static sameAccountReplace()V
    .registers 1

    sget v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->up:I

    add-int/lit8 v0, v0, 0x1

    sput v0, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->up:I

    return-void
.end method

.method public static summary()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\nCP247 TEST LC="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->lc:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " LO="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->lo:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " UP="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->up:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " IP="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->ip:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " ENQ="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->en:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " BF="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget v1, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->bf:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
