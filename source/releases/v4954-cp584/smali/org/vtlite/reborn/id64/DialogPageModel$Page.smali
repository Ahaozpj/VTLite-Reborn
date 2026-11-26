.class public final Lorg/vtlite/reborn/id64/DialogPageModel$Page;
.super Ljava/lang/Object;
.source "DialogPageModel.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/DialogPageModel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Page"
.end annotation


# instance fields
.field public final rows:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/DialogPageModel$Row;",
            ">;"
        }
    .end annotation
.end field

.field private final snapshot:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;


# direct methods
.method private constructor <init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;",
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/DialogPageModel$Row;",
            ">;)V"
        }
    .end annotation

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->snapshot:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->rows:Ljava/util/List;

    return-void
.end method

.method synthetic constructor <init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;Ljava/util/List;Lorg/vtlite/reborn/id64/DialogPageModel$1;)V
    .registers 4

    .line 27
    invoke-direct {p0, p1, p2}, Lorg/vtlite/reborn/id64/DialogPageModel$Page;-><init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public canNavigate()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public canWriteStorage()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public cp504NeedsLegacyIdProtection()Z
    .registers 1

    iget-object p0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->snapshot:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    invoke-static {p0}, Lorg/vtlite/reborn/id64/ResponseEntryGuard;->cp504NeedsProtection(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;)Z

    move-result p0

    return p0
.end method

.method public groupCount()I
    .registers 1

    .line 35
    iget-object p0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->snapshot:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    iget-object p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->groups:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public needsLegacyProfileProtection()Z
    .registers 1

    .line 36
    iget-object p0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->snapshot:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    iget-boolean p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->hasLegacyInvalidProfile:Z

    return p0
.end method

.method public originalStringIdenticalTo(Ljava/lang/String;)Z
    .registers 2

    .line 33
    iget-object p0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->snapshot:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->originalStringIdenticalTo(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public profileCount()I
    .registers 1

    .line 34
    iget-object p0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->snapshot:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    iget-object p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->profiles:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 39
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CP351 Page(rows="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->rows:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, ",REDACTED)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
