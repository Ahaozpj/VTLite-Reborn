.class public final Lorg/vtlite/reborn/security/CookieJarMigrationCore$SecurityFailure;
.super Ljava/lang/Exception;
.source "CookieJarMigrationCore.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/security/CookieJarMigrationCore;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "SecurityFailure"
.end annotation


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 26
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-void
.end method
