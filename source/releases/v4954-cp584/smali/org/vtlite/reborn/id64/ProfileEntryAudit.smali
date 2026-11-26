.class public final Lorg/vtlite/reborn/id64/ProfileEntryAudit;
.super Ljava/lang/Object;
.source "ProfileEntryAudit.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static inspect(Ljava/lang/String;)Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;
    .registers 3

    .line 15
    if-eqz p0, :cond_43

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_43

    .line 16
    :cond_9
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/high16 v1, 0x80000

    if-le v0, v1, :cond_14

    sget-object p0, Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;->SIZE_LIMIT:Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;

    return-object p0

    .line 19
    :cond_14
    :try_start_14
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->decodeResponse(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0
    :try_end_18
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_18} :catch_3c
    .catch Ljava/lang/LinkageError; {:try_start_14 .. :try_end_18} :catch_3a

    .line 20
    nop

    .line 22
    :try_start_19
    invoke-static {v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->hasIncompatibleProfile(Ljava/util/Map;)Z

    move-result v1
    :try_end_1d
    .catch Ljava/lang/RuntimeException; {:try_start_19 .. :try_end_1d} :catch_36
    .catch Ljava/lang/LinkageError; {:try_start_19 .. :try_end_1d} :catch_3a

    .line 23
    nop

    .line 24
    if-nez v1, :cond_23

    :try_start_20
    sget-object p0, Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;->LEGACY_PROFILE_COMPATIBLE:Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;
    :try_end_22
    .catch Ljava/lang/LinkageError; {:try_start_20 .. :try_end_22} :catch_3a

    return-object p0

    .line 26
    :cond_23
    nop

    .line 27
    :try_start_24
    invoke-static {p0, v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->captureDecoded(Ljava/lang/String;Ljava/util/Map;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;

    move-result-object p0

    .line 28
    iget-boolean p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->hasLegacyInvalidProfile:Z

    if-eqz p0, :cond_2f

    .line 29
    sget-object p0, Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;->INCOMPATIBLE_PROFILE_FULL_PAGE_OK:Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;

    goto :goto_31

    .line 30
    :cond_2f
    sget-object p0, Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;->INCOMPATIBLE_PROFILE_FULL_PAGE_UNSUPPORTED:Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;
    :try_end_31
    .catch Ljava/lang/RuntimeException; {:try_start_24 .. :try_end_31} :catch_32
    .catch Ljava/lang/LinkageError; {:try_start_24 .. :try_end_31} :catch_3a

    .line 28
    :goto_31
    return-object p0

    .line 31
    :catch_32
    move-exception p0

    :try_start_33
    sget-object p0, Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;->INCOMPATIBLE_PROFILE_FULL_PAGE_UNSUPPORTED:Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;

    return-object p0

    .line 23
    :catch_36
    move-exception p0

    sget-object p0, Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;->PROFILE_SCHEMA_UNSUPPORTED:Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;

    return-object p0

    .line 32
    :catch_3a
    move-exception p0

    goto :goto_40

    .line 20
    :catch_3c
    move-exception p0

    sget-object p0, Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;->ENVELOPE_OR_JSON_UNSUPPORTED:Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;
    :try_end_3f
    .catch Ljava/lang/LinkageError; {:try_start_33 .. :try_end_3f} :catch_3a

    return-object p0

    .line 32
    :goto_40
    sget-object p0, Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;->LINKAGE_FAILURE:Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;

    return-object p0

    .line 15
    :cond_43
    :goto_43
    sget-object p0, Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;->NULL_OR_EMPTY:Lorg/vtlite/reborn/id64/ProfileEntryAudit$Result;

    return-object p0
.end method
