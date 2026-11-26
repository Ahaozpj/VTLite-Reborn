.class public final Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;
.super Ljava/lang/Object;
.source "LosslessResponseShadow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/LosslessResponseShadow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Item"
.end annotation


# instance fields
.field public final author:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

.field public final matchedGroupPositions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final matchedProfilePositions:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public final message:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

.field public final peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

.field public final position:I


# direct methods
.method private constructor <init>(ILorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Ljava/util/List;Ljava/util/List;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->position:I

    iput-object p2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iput-object p3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->author:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iput-object p4, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->message:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    .line 55
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->immutable(Ljava/util/List;)Ljava/util/List;
    invoke-static {p5}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$100(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->matchedProfilePositions:Ljava/util/List;

    .line 56
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->immutable(Ljava/util/List;)Ljava/util/List;
    invoke-static {p6}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$100(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->matchedGroupPositions:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(ILorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Ljava/util/List;Ljava/util/List;Lorg/vtlite/reborn/id64/LosslessResponseShadow$1;)V
    .registers 8

    .line 47
    invoke-direct/range {p0 .. p6}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;-><init>(ILorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 3

    .line 58
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Item(position="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->position:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ",ids=REDACTED)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
