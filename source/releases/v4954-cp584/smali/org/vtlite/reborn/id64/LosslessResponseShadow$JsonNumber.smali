.class final Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;
.super Ljava/lang/Object;
.source "LosslessResponseShadow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/LosslessResponseShadow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "JsonNumber"
.end annotation


# instance fields
.field final text:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;->text:Ljava/lang/String;

    return-void
.end method
