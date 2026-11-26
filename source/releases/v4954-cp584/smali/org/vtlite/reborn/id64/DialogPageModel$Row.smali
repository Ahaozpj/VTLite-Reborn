.class public final Lorg/vtlite/reborn/id64/DialogPageModel$Row;
.super Ljava/lang/Object;
.source "DialogPageModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/DialogPageModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Row"
.end annotation


# instance fields
.field public final author:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

.field public cp579Avatar:Ljava/lang/String;

.field public final date:Ljava/lang/Long;

.field public final message:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

.field public final peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

.field public final position:I

.field public final preview:Ljava/lang/String;

.field public final title:Ljava/lang/String;

.field public final titleState:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

.field public final unreadCount:Ljava/lang/Long;


# direct methods
.method private constructor <init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;Ljava/lang/String;Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;)V
    .registers 8

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    iget v0, p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->position:I

    iput v0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->position:I

    iget-object v0, p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iget-object v0, p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->author:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iput-object v0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->author:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iget-object p1, p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->message:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->message:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    .line 23
    iput-object p2, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->title:Ljava/lang/String;

    iput-object p3, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->titleState:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    iput-object p4, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->preview:Ljava/lang/String;

    iput-object p5, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->date:Ljava/lang/Long;

    iput-object p6, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->unreadCount:Ljava/lang/Long;

    return-void
.end method

.method synthetic constructor <init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;Ljava/lang/String;Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;Lorg/vtlite/reborn/id64/DialogPageModel$1;)V
    .registers 8

    .line 15
    invoke-direct/range {p0 .. p6}, Lorg/vtlite/reborn/id64/DialogPageModel$Row;-><init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;Ljava/lang/String;Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;Ljava/lang/String;Ljava/lang/Long;Ljava/lang/Long;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .registers 1

    .line 25
    const-string p0, "CP351 Row(REDACTED)"

    return-object p0
.end method
