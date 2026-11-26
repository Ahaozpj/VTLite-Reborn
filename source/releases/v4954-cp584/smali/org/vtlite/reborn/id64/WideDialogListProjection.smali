.class public final Lorg/vtlite/reborn/id64/WideDialogListProjection;
.super Ljava/lang/Object;
.source "WideDialogListProjection.java"


# instance fields
.field private final lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

.field private final status:I


# direct methods
.method private constructor <init>(Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    iput p2, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->status:I

    return-void
.end method

.method public static capture(Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;)Lorg/vtlite/reborn/id64/WideDialogListProjection;
    .registers 13

    if-eqz p0, :cond_5d

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->flags()I

    move-result v0

    and-int/lit8 v11, v0, 0xc

    if-nez v11, :cond_54

    :try_start_a
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->size()I

    move-result v1

    const/16 v11, 0x1000

    if-gt v1, v11, :cond_52

    const/4 v2, 0x0

    :goto_13
    if-ge v2, v1, :cond_49

    invoke-virtual {p0, v2}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->peerId(I)J

    move-result-wide v3

    const-wide/16 v9, 0x0

    cmp-long v11, v3, v9

    if-eqz v11, :cond_4f

    invoke-virtual {p0, v2}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->senderId(I)J

    move-result-wide v5

    cmp-long v11, v5, v9

    if-eqz v11, :cond_4f

    invoke-virtual {p0, v2}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->messageId(I)J

    move-result-wide v7

    cmp-long v11, v7, v9

    if-lez v11, :cond_4f

    invoke-virtual {p0, v2}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->lastDate(I)J

    move-result-wide v7

    cmp-long v11, v7, v9

    if-lez v11, :cond_4f

    invoke-virtual {p0, v2}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->unreadCount(I)I

    move-result v11

    if-ltz v11, :cond_4f

    invoke-virtual {p0, v2}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->peerKind(I)I

    move-result v11

    if-ltz v11, :cond_4f

    const/4 v9, 0x3

    if-gt v11, v9, :cond_4f

    add-int/lit8 v2, v2, 0x1

    goto :goto_13

    :cond_49
    new-instance v1, Lorg/vtlite/reborn/id64/WideDialogListProjection;

    invoke-direct {v1, p0, v0}, Lorg/vtlite/reborn/id64/WideDialogListProjection;-><init>(Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;I)V
    :try_end_4e
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_4e} :catch_59

    return-object v1

    :cond_4f
    or-int/lit8 v0, v0, 0x4

    goto :goto_54

    :cond_52
    or-int/lit8 v0, v0, 0x8

    :cond_54
    :goto_54
    invoke-static {v0}, Lorg/vtlite/reborn/id64/WideDialogListProjection;->failed(I)Lorg/vtlite/reborn/id64/WideDialogListProjection;

    move-result-object v1

    return-object v1

    :catch_59
    move-exception v11

    or-int/lit8 v0, v0, 0x4

    goto :goto_54

    :cond_5d
    const/4 v0, 0x4

    goto :goto_54
.end method

.method private static failed(I)Lorg/vtlite/reborn/id64/WideDialogListProjection;
    .registers 3

    new-instance v0, Lorg/vtlite/reborn/id64/WideDialogListProjection;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0}, Lorg/vtlite/reborn/id64/WideDialogListProjection;-><init>(Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;I)V

    return-object v0
.end method


# virtual methods
.method public displayAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public flags()I
    .registers 2

    iget v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->status:I

    return v0
.end method

.method public lastDate(I)J
    .registers 4

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->lastDate(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public legacyStorageWriteAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public messageId(I)J
    .registers 4

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->messageId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public navigationAuthorized(I)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public navigationReason(I)I
    .registers 9

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    if-eqz v0, :cond_48

    if-ltz p1, :cond_48

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->size()I

    move-result v1

    if-ge p1, v1, :cond_48

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->peerKind(I)I

    move-result v2

    if-lez v2, :cond_46

    const/4 v1, 0x3

    if-gt v2, v1, :cond_46

    const/4 v1, 0x3

    if-eq v2, v1, :cond_1e

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->peerProfileIndex(I)I

    move-result v1

    if-ltz v1, :cond_46

    :cond_1e
    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->peerId(I)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-eqz v1, :cond_48

    const-wide/32 v5, 0x7fffffff

    cmp-long v1, v3, v5

    if-gtz v1, :cond_44

    const-wide/32 v5, -0x80000000

    cmp-long v1, v3, v5

    if-ltz v1, :cond_44

    const/4 v1, 0x1

    if-ne v2, v1, :cond_42

    const-wide/32 v5, 0x77359400

    cmp-long v1, v3, v5

    if-ltz v1, :cond_42

    const/4 v0, 0x4

    return v0

    :cond_42
    const/4 v0, 0x5

    return v0

    :cond_44
    const/4 v0, 0x3

    return v0

    :cond_46
    const/4 v0, 0x2

    return v0

    :cond_48
    const/4 v0, 0x1

    return v0
.end method

.method public peerId(I)J
    .registers 4

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->peerId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public peerKind(I)I
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->peerKind(I)I

    move-result v0

    return v0
.end method

.method public peerProfileIndex(I)I
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->peerProfileIndex(I)I

    move-result v0

    return v0
.end method

.method public senderId(I)J
    .registers 4

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->senderId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public size()I
    .registers 2

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    :cond_6
    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->size()I

    move-result v0

    return v0
.end method

.method public unreadCount(I)I
    .registers 3

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WideDialogListProjection;->lane:Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;

    invoke-virtual {v0, p1}, Lorg/vtlite/reborn/id64/WideDialogReadOnlyLane;->unreadCount(I)I

    move-result v0

    return v0
.end method

.method public v2StorageWriteAuthorized()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
