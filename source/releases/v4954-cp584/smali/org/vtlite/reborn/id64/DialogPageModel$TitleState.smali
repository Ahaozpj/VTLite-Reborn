.class public final enum Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;
.super Ljava/lang/Enum;
.source "DialogPageModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/DialogPageModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TitleState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

.field public static final enum AMBIGUOUS:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

.field public static final enum MISSING:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

.field public static final enum RESOLVED:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

.field public static final enum UNSUPPORTED_SIGN:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;


# direct methods
.method private static synthetic $values()[Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;
    .registers 4

    .line 14
    sget-object v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->RESOLVED:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    sget-object v1, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->MISSING:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    sget-object v2, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->AMBIGUOUS:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    sget-object v3, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->UNSUPPORTED_SIGN:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    filled-new-array {v0, v1, v2, v3}, [Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    move-result-object v0

    return-object v0
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 14
    new-instance v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    const-string v1, "RESOLVED"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->RESOLVED:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    new-instance v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    const-string v1, "MISSING"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->MISSING:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    new-instance v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    const-string v1, "AMBIGUOUS"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->AMBIGUOUS:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    new-instance v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    const-string v1, "UNSUPPORTED_SIGN"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->UNSUPPORTED_SIGN:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    invoke-static {}, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->$values()[Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    move-result-object v0

    sput-object v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->$VALUES:[Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

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

    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 14
    const-class v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    return-object p0
.end method

.method public static values()[Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;
    .registers 1

    .line 14
    sget-object v0, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->$VALUES:[Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    invoke-virtual {v0}, [Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    return-object v0
.end method
