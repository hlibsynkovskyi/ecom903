<?php

namespace App\Service;

use App\Entity\Order;
use App\Repository\OrderRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Session\Session;

class OrderService
{

    const SESSION_KEY = 'currentOrder';

    /**
     * @var EntityManagerInterface
     */
    private $entityManager;

    /**
     * @var Session
     */
    private $sessions;

    /**
     * @var OrderRepository
     */
    private $orderRepo;

    public function __construct(
        EntityManagerInterface $entityManager,
        Session $sessions,
        OrderRepository $orderRepo
    ) {
        $this->entityManager = $entityManager;
        $this->sessions = $sessions;
        $this->orderRepo = $orderRepo;
    }

    public function getOrder(): Order
    {
        $order = null;
        $orderId = $this->sessions->get(self::SESSION_KEY);

        if ($orderId) {
            $order = $this->orderRepo->find($orderId);
        }

        if (!$order) {
            $order = new Order();
        }

        return $order;
    }

}
