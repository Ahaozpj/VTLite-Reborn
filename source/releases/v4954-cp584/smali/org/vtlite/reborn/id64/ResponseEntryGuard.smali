.class public final Lorg/vtlite/reborn/id64/ResponseEntryGuard;
.super Ljava/lang/Object;
.source "ResponseEntryGuard.java"


# static fields
.field public static final BLOCK_CONFIRMED_PROFILE:I = 0x1

.field public static final LEGACY_UNCHANGED:I = 0x0

.field static final MAX_ENTRY_CHARS:I = 0x80000

.field public static final UNCLASSIFIED:I = 0x2


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static classify(Ljava/lang/String;)I
    .registers 4

    const/4 v0, 0x2

    if-eqz p0, :cond_1c

    .line 14
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/high16 v2, 0x80000

    if-le v1, v2, :cond_c

    goto :goto_1c

    .line 16
    :cond_c
    :try_start_c
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->capture(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    move-result-object v1

    .line 17
    invoke-virtual {v1, p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->originalStringIdenticalTo(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_17

    return v0

    .line 18
    :cond_17
    invoke-static {v1}, Lorg/vtlite/reborn/id64/ResponseEntryGuard;->cp504NeedsProtection(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;)Z

    move-result p0
    :try_end_1b
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_1b} :catch_1c
    .catch Ljava/lang/LinkageError; {:try_start_c .. :try_end_1b} :catch_1c

    return p0

    :catch_1c
    :cond_1c
    :goto_1c
    return v0
.end method

.method public static cp504NeedsProtection(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;)Z
    .registers 5

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->hasLegacyInvalidProfile:Z

    if-nez v0, :cond_4a

    iget-object v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->groups:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1d

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    invoke-static {v1}, Lorg/vtlite/reborn/id64/ResponseEntryGuard;->cp504OutsideInt(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Z

    move-result v1

    if-nez v1, :cond_4a

    goto :goto_a

    :cond_1d
    iget-object v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->items:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_23
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_48

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;

    iget-object v2, v1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    invoke-static {v2}, Lorg/vtlite/reborn/id64/ResponseEntryGuard;->cp504OutsideInt(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Z

    move-result v2

    if-nez v2, :cond_4a

    iget-object v2, v1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->author:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    invoke-static {v2}, Lorg/vtlite/reborn/id64/ResponseEntryGuard;->cp504OutsideInt(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Z

    move-result v2

    if-nez v2, :cond_4a

    iget-object v2, v1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;->message:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    invoke-static {v2}, Lorg/vtlite/reborn/id64/ResponseEntryGuard;->cp504OutsideInt(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Z

    move-result v2

    if-nez v2, :cond_4a

    goto :goto_23

    :cond_48
    const/4 v0, 0x0

    return v0

    :cond_4a
    const/4 v0, 0x1

    return v0
.end method

.method private static cp504OutsideInt(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Z
    .registers 6

    iget-wide v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    const-wide/32 v2, 0x7fffffff

    cmp-long v4, v0, v2

    if-gtz v4, :cond_12

    const-wide/32 v2, -0x80000000

    cmp-long v4, v0, v2

    if-ltz v4, :cond_12

    const/4 v0, 0x0

    return v0

    :cond_12
    const/4 v0, 0x1

    return v0
.end method
