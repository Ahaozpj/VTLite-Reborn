.class public final enum Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;
.super Ljava/lang/Enum;
.source "LosslessResponseShadow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/LosslessResponseShadow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Kind"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

.field public static final enum AUTHOR_UNTYPED:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

.field public static final enum CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

.field public static final enum GROUP:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

.field public static final enum MESSAGE:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

.field public static final enum USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;


# direct methods
.method private static synthetic $values()[Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;
    .registers 5

    .line 25
    sget-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->GROUP:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v2, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v3, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->AUTHOR_UNTYPED:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v4, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->MESSAGE:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    filled-new-array {v0, v1, v2, v3, v4}, [Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 25
    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    const-string v1, "USER"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    const-string v1, "GROUP"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->GROUP:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    const-string v1, "CHAT"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    const-string v1, "AUTHOR_UNTYPED"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->AUTHOR_UNTYPED:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    new-instance v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    const-string v1, "MESSAGE"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->MESSAGE:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    invoke-static {}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->$values()[Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    move-result-object v0

    sput-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->$VALUES:[Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 25
    const-class v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    return-object p0
.end method

.method public static values()[Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;
    .registers 1

    .line 25
    sget-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->$VALUES:[Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    invoke-virtual {v0}, [Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    return-object v0
.end method
