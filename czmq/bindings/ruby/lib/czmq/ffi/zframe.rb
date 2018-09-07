################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

module CZMQ
  module FFI

    # working with single message frames
    # @note This class is 100% generated using zproject.
    class Zframe
      #
      MORE = 1

      #
      REUSE = 2

      #
      DONTWAIT = 4

      # Raised when one tries to use an instance of {Zframe} after
      # the internal pointer to the native object has been nullified.
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      # Attaches the pointer _ptr_ to this instance and defines a finalizer for
      # it if necessary.
      # @param ptr [::FFI::Pointer]
      # @param finalize [Boolean]
      def initialize(ptr, finalize = true)
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      # @param ptr [::FFI::Pointer]
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::CZMQ::FFI.zframe_destroy ptr_ptr
        end
      end
      # @return [Boolean]
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      # @return [::FFI::Pointer]
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer.
      # @note This detaches the current instance from the native object
      #   and thus makes it unusable.
      # @return [::FFI::MemoryPointer] the pointer pointing to a pointer
      #   pointing to the native object
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        __undef_finalizer if @finalizer
        @ptr = nil
        ptr_ptr
      end
      # Undefines the finalizer for this object.
      # @note Only use this if you need to and can guarantee that the native
      #   object will be freed by other means.
      # @return [void]
      def __undef_finalizer
        ObjectSpace.undefine_finalizer self
        @finalizer = nil
      end

      # Create a new frame. If size is not null, allocates the frame data
      # to the specified size. If additionally, data is not null, copies
      # size octets from the specified data into the frame body.
      # @param data [::FFI::Pointer, #to_ptr]
      # @param size [Integer, #to_int, #to_i]
      # @return [CZMQ::Zframe]
      def self.new(data, size)
        size = Integer(size)
        ptr = ::CZMQ::FFI.zframe_new(data, size)
        __new ptr
      end

      # Create an empty (zero-sized) frame
      # @return [CZMQ::Zframe]
      def self.new_empty()
        ptr = ::CZMQ::FFI.zframe_new_empty()
        __new ptr
      end

      # Create a frame with a specified string content.
      # @param string [String, #to_s, nil]
      # @return [CZMQ::Zframe]
      def self.from(string)
        ptr = ::CZMQ::FFI.zframe_from(string)
        __new ptr
      end

      # Receive frame from socket, returns zframe_t object or NULL if the recv
      # was interrupted. Does a blocking recv, if you want to not block then use
      # zpoller or zloop.
      # @param source [::FFI::Pointer, #to_ptr]
      # @return [CZMQ::Zframe]
      def self.recv(source)
        ptr = ::CZMQ::FFI.zframe_recv(source)
        __new ptr
      end

      # Destroy a frame
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zframe_destroy(self_p)
        result
      end

      # Send a frame to a socket, destroy frame after sending.
      # Return -1 on error, 0 on success.
      #
      # @param self_p [#__ptr_give_ref]
      # @param dest [::FFI::Pointer, #to_ptr]
      # @param flags [Integer, #to_int, #to_i]
      # @return [Integer]
      def self.send(self_p, dest, flags)
        self_p = self_p.__ptr_give_ref
        flags = Integer(flags)
        result = ::CZMQ::FFI.zframe_send(self_p, dest, flags)
        result
      end

      # Return number of bytes in frame data
      #
      # @return [Integer]
      def size()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_size(self_p)
        result
      end

      # Return address of frame data
      #
      # @return [::FFI::Pointer]
      def data()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_data(self_p)
        result
      end

      # Return meta data property for frame
      # The caller shall not modify or free the returned value, which shall be
      # owned by the message.
      #
      # @param property [String, #to_s, nil]
      # @return [String]
      def meta(property)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_meta(self_p, property)
        result
      end

      # Create a new frame that duplicates an existing frame. If frame is null,
      # or memory was exhausted, returns null.
      #
      # @return [Zframe]
      def dup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_dup(self_p)
        result = Zframe.__new result, true
        result
      end

      # Return frame data encoded as printable hex string, useful for 0MQ UUIDs.
      # Caller must free string when finished with it.
      #
      # @return [::FFI::AutoPointer]
      def strhex()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_strhex(self_p)
        result = ::FFI::AutoPointer.new(result, LibC.method(:free))
        result
      end

      # Return frame data copied into freshly allocated string
      # Caller must free string when finished with it.
      #
      # @return [::FFI::AutoPointer]
      def strdup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_strdup(self_p)
        result = ::FFI::AutoPointer.new(result, LibC.method(:free))
        result
      end

      # Return TRUE if frame body is equal to string, excluding terminator
      #
      # @param string [String, #to_s, nil]
      # @return [Boolean]
      def streq(string)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_streq(self_p, string)
        result
      end

      # Return frame MORE indicator (1 or 0), set when reading frame from socket
      # or by the zframe_set_more() method
      #
      # @return [Integer]
      def more()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_more(self_p)
        result
      end

      # Set frame MORE indicator (1 or 0). Note this is NOT used when sending
      # frame to socket, you have to specify flag explicitly.
      #
      # @param more [Integer, #to_int, #to_i]
      # @return [void]
      def set_more(more)
        raise DestroyedError unless @ptr
        self_p = @ptr
        more = Integer(more)
        result = ::CZMQ::FFI.zframe_set_more(self_p, more)
        result
      end

      # Return frame routing ID, if the frame came from a ZMQ_SERVER socket.
      # Else returns zero.
      #
      # @return [Integer]
      def routing_id()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_routing_id(self_p)
        result
      end

      # Set routing ID on frame. This is used if/when the frame is sent to a
      # ZMQ_SERVER socket.
      #
      # @param routing_id [Integer, #to_int, #to_i]
      # @return [void]
      def set_routing_id(routing_id)
        raise DestroyedError unless @ptr
        self_p = @ptr
        routing_id = Integer(routing_id)
        result = ::CZMQ::FFI.zframe_set_routing_id(self_p, routing_id)
        result
      end

      # Return frame group of radio-dish pattern.
      #
      # @return [String]
      def group()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_group(self_p)
        result
      end

      # Set group on frame. This is used if/when the frame is sent to a
      # ZMQ_RADIO socket.
      # Return -1 on error, 0 on success.
      #
      # @param group [String, #to_s, nil]
      # @return [Integer]
      def set_group(group)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_set_group(self_p, group)
        result
      end

      # Return TRUE if two frames have identical size and data
      # If either frame is NULL, equality is always false.
      #
      # @param other [Zframe, #__ptr]
      # @return [Boolean]
      def eq(other)
        raise DestroyedError unless @ptr
        self_p = @ptr
        other = other.__ptr if other
        result = ::CZMQ::FFI.zframe_eq(self_p, other)
        result
      end

      # Set new contents for frame
      #
      # @param data [::FFI::Pointer, #to_ptr]
      # @param size [Integer, #to_int, #to_i]
      # @return [void]
      def reset(data, size)
        raise DestroyedError unless @ptr
        self_p = @ptr
        size = Integer(size)
        result = ::CZMQ::FFI.zframe_reset(self_p, data, size)
        result
      end

      # Send message to zsys log sink (may be stdout, or system facility as
      # configured by zsys_set_logstream). Prefix shows before frame, if not null.
      #
      # @param prefix [String, #to_s, nil]
      # @return [void]
      def print(prefix)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zframe_print(self_p, prefix)
        result
      end

      # Probe the supplied object, and report if it looks like a zframe_t.
      #
      # @param self_ [::FFI::Pointer, #to_ptr]
      # @return [Boolean]
      def self.is(self_)
        result = ::CZMQ::FFI.zframe_is(self_)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zframe_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
