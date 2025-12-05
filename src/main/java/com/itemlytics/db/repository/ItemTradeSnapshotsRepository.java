package com.itemlytics.db.repository;

import com.itemlytics.db.domain.ItemTradeSnapshotsEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface ItemTradeSnapshotsRepository extends JpaRepository<ItemTradeSnapshotsEntity, Long> {
    List<ItemTradeSnapshotsEntity> findByItemCodeOrderByCrawledAtDesc(Integer itemCode);

    List<ItemTradeSnapshotsEntity> findByItemCodeAndWorldOrderByCrawledAtDesc(Integer itemCode, String world);

    List<ItemTradeSnapshotsEntity> findByCrawledAtAfter(LocalDateTime from);
}
