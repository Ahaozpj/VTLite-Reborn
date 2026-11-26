.class public final Lorg/vtlite/reborn/id64/CP500HistoryRow;
.super Ljava/lang/Object;


# instance fields
.field public final messageId:J

.field public final senderId:J

.field public final text:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/vtlite/reborn/id64/CP500HistoryRow;->messageId:J

    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/vtlite/reborn/id64/CP500HistoryRow;->senderId:J

    iput-object p3, p0, Lorg/vtlite/reborn/id64/CP500HistoryRow;->text:Ljava/lang/String;

    return-void
.end method

.method static of(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;)Lorg/vtlite/reborn/id64/CP500HistoryRow;
    .registers 4

    new-instance v0, Lorg/vtlite/reborn/id64/CP500HistoryRow;

    invoke-direct {v0, p0, p1, p2}, Lorg/vtlite/reborn/id64/CP500HistoryRow;-><init>(Ljava/lang/Long;Ljava/lang/Long;Ljava/lang/String;)V

    return-object v0
.end method
