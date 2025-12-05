package com.itemlytics.db.repository;

import com.itemlytics.db.domain.ItemEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ItemRepository extends JpaRepository<ItemEntity, Long> {
    Optional<ItemEntity> findByItemCode(Integer itemCode);
}
