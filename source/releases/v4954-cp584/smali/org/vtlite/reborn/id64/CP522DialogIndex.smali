.class public final Lorg/vtlite/reborn/id64/CP522DialogIndex;
.super Ljava/lang/Object;


# instance fields
.field private final byPeer:Ljava/util/Map;

.field private final ordered:Ljava/util/List;


# direct methods
.method private constructor <init>(Ljava/util/List;Ljava/util/Map;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP522DialogIndex;->ordered:Ljava/util/List;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/CP522DialogIndex;->byPeer:Ljava/util/Map;

    return-void
.end method

.method public static fromPage(Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/CP522DialogIndex;
    .registers 11

    const/4 v0, 0x0

    if-eqz p0, :cond_4d

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->rows:Ljava/util/List;

    if-eqz v1, :cond_4d

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/16 v3, 0x1000

    if-gt v2, v3, :cond_4d

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const/4 v5, 0x0

    :goto_1a
    if-ge v5, v2, :cond_48

    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    instance-of v7, v6, Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    if-eqz v7, :cond_4d

    check-cast v6, Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    iget v7, v6, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->position:I

    if-ne v7, v5, :cond_4d

    iget-object v7, v6, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    if-eqz v7, :cond_4d

    iget-object v8, v7, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v9, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-eq v8, v9, :cond_3c

    sget-object v9, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->GROUP:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-eq v8, v9, :cond_3c

    sget-object v9, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-ne v8, v9, :cond_4d

    :cond_3c
    invoke-interface {v4, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_4d

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_1a

    :cond_48
    new-instance v0, Lorg/vtlite/reborn/id64/CP522DialogIndex;

    invoke-direct {v0, v3, v4}, Lorg/vtlite/reborn/id64/CP522DialogIndex;-><init>(Ljava/util/List;Ljava/util/Map;)V

    :cond_4d
    return-object v0
.end method


# virtual methods
.method public find(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Lorg/vtlite/reborn/id64/DialogPageModel$Row;
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP522DialogIndex;->byPeer:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    return-object v0
.end method

.method public size()I
    .registers 2

    iget-object v0, p0, Lorg/vtlite/reborn/id64/CP522DialogIndex;->ordered:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    const-string v0, "CP522DialogIndex(REDACTED)"

    return-object v0
.end method

.method public window(II)Ljava/util/List;
    .registers 7

    const/4 v0, 0x0

    if-ltz p1, :cond_1c

    if-lez p2, :cond_1c

    const/16 v1, 0x64

    if-gt p2, v1, :cond_1c

    iget-object v1, p0, Lorg/vtlite/reborn/id64/CP522DialogIndex;->ordered:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-gt p1, v2, :cond_1c

    sub-int v3, v2, p1

    invoke-static {v3, p2}, Ljava/lang/Math;->min(II)I

    move-result v3

    add-int/2addr v3, p1

    invoke-interface {v1, p1, v3}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v0

    :cond_1c
    return-object v0
.end method
