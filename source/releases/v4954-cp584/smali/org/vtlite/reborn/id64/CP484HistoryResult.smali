.class public final Lorg/vtlite/reborn/id64/CP484HistoryResult;
.super Ljava/lang/Object;


# instance fields
.field public final cp500Peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

.field public final cp500Rows:Ljava/util/List;

.field public final status:I

.field public final text:Ljava/lang/String;


# direct methods
.method private constructor <init>(ILjava/lang/String;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->status:I

    iput-object p2, p0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->text:Ljava/lang/String;

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->cp500Peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->cp500Rows:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(ILjava/lang/String;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Ljava/util/List;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->status:I

    iput-object p2, p0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->text:Ljava/lang/String;

    iput-object p3, p0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->cp500Peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->cp500Rows:Ljava/util/List;

    return-void
.end method

.method static cp500OfRows(ILjava/lang/String;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Ljava/util/List;)Lorg/vtlite/reborn/id64/CP484HistoryResult;
    .registers 5

    new-instance v0, Lorg/vtlite/reborn/id64/CP484HistoryResult;

    invoke-direct {v0, p0, p1, p2, p3}, Lorg/vtlite/reborn/id64/CP484HistoryResult;-><init>(ILjava/lang/String;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;Ljava/util/List;)V

    return-object v0
.end method

.method public static of(ILjava/lang/String;)Lorg/vtlite/reborn/id64/CP484HistoryResult;
    .registers 3

    new-instance v0, Lorg/vtlite/reborn/id64/CP484HistoryResult;

    invoke-direct {v0, p0, p1}, Lorg/vtlite/reborn/id64/CP484HistoryResult;-><init>(ILjava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public marker()Ljava/lang/String;
    .registers 3

    iget v0, p0, Lorg/vtlite/reborn/id64/CP484HistoryResult;->status:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_b

    const/4 v1, 0x2

    if-eq v0, v1, :cond_e

    const-string v0, "HISTORY_PARSE_REJECTED"

    return-object v0

    :cond_b
    const-string v0, "HISTORY_PARSE_ACCEPTED"

    return-object v0

    :cond_e
    const-string v0, "HISTORY_PARSE_EMPTY"

    return-object v0
.end method
