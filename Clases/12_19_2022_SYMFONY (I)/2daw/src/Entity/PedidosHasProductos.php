<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PedidosHasProductos
 *
 * @ORM\Table(name="pedidos_has_productos")
 * @ORM\Entity
 */
class PedidosHasProductos
{
    /**
     * @var int
     *
     * @ORM\Column(name="pedido_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $pedidoId;

    /**
     * @var int
     *
     * @ORM\Column(name="producto_id", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $productoId;

    /**
     * @var int
     *
     * @ORM\Column(name="unidades", type="integer", nullable=false)
     */
    private $unidades;

    /**
     * @var float|null
     *
     * @ORM\Column(name="precio", type="float", precision=10, scale=0, nullable=true)
     */
    private $precio = '0';

    public function getPedidoId(): ?int
    {
        return $this->pedidoId;
    }

    public function getProductoId(): ?int
    {
        return $this->productoId;
    }

    public function getUnidades(): ?int
    {
        return $this->unidades;
    }

    public function setUnidades(int $unidades): self
    {
        $this->unidades = $unidades;

        return $this;
    }

    public function getPrecio(): ?float
    {
        return $this->precio;
    }

    public function setPrecio(?float $precio): self
    {
        $this->precio = $precio;

        return $this;
    }


}
