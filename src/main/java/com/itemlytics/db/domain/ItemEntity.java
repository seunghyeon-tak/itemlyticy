package com.itemlytics.db.domain;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "items")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "item_code", nullable = false, unique = true)
    private Integer itemCode;

    @Column(name = "name_ko", nullable = false)
    private String nameKo;

    @Column(name = "name_en")
    private String nameEn;

    private String category;

    private String subcategory;

    @Column(name = "required_level")
    private Integer requiredLevel;

    @Column(name = "icon_url", length = 500)
    private String iconUrl;

    @Column(name = "is_cash", nullable = false)
    private Boolean isCash;

    @Column(name = "raw_json", columnDefinition = "json", nullable = false)
    private String rawJson;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
